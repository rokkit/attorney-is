# encoding: UTF-8

class UsersController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!
  
  autocomplete :user, :register_number, :full => true, display_value: :autocomplete_display, extra_data: [:register_number, :lastname, :firstname, :secondname]
  
  # GET /users
  # GET /users.json
  def index
    if params[:dom].present?
      @domain = Domain.find params[:dom]
      @users = User.where("encrypted_password <> ''").with_role :attorney
      @users = @users.map { |user| user if user.roles.any? {|r|r.resource_id == @domain.id} }.compact
      @users = Kaminari.paginate_array(@users).page(params[:page]).per(30)
    else
      @users = User.page(params[:page]).per(30)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  
  def base_index
    @users = User.where("lastname <> '' and encrypted_password <> ''").page(params[:page]).per(30)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: UsersDatatable.new(view_context) }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @meetings = @user.meetings
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    # @user = User.new(params[:user])
    @user = User.invite!(params[:user])
    respond_to do |format|
      if @user.valid?
        format.html { redirect_to @user, notice: 'Аккаунт успешно создан' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    unless @user.encrypted_password.present?
      @user.set_password
      @user.email = params[:user][:email]
      @user.save
    end
    respond_to do |format|
      if @user.update_attributes(params[:user])
    if current_user.admin?
      if params[:domain].present?
        
        domains = params[:domain].keys
        domains.each do |domain|
          @user.grant :attorney, Domain.find(domain.to_i)
          role = @user.roles.where(resource_id: domain.to_i).first
          role.start_date = DateTime.parse(params[:roles][domain.to_s]['start']) if params[:roles][domain.to_s]['start'].present?
          role.end_date = DateTime.parse(params[:roles][domain.to_s]['end']) if params[:roles][domain.to_s]['end'].present?
          role.save!
          @user.save
        end
        @user.roles.each do |user_role|
          unless domains.include? user_role.resource_id.to_s
            puts "delete role #{user_role.id}"
            user_role.destroy if user_role.resource_id.present?
          end
        end
      else
        @user.roles.each {|r| r.destroy if r.resource_id.present? }
      end
      

      
    end

        format.html { redirect_to @user, notice: 'Аккаунт успешно обновлен' }
        format.json { render json: @user }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def generate_and_send_password
    @user = User.find(params[:id])
    @user.set_password
    flash[:notice] = "Пароль создан и отправлен адвокату"
    redirect_to @user
  end
  
  def send_password_to_all
    flash[:notice] = "Рассылка паролей выполнена"
    redirect_to pages_panel_path
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Адвокат исключён из системы' }
      format.json { head :no_content }
    end
  end
  def abilities
  end
  
  def manage_abilities
    @user = User.find(params[:id])
    @user.email = nil unless @user.encrypted_password.present?
  end
  
  def import
    User.import(params[:file])
    redirect_to users_url, notice: "Импорт данных выполнен"
  end
  
  def statistics
    if params[:attorney_fio].present?
      fio = params[:attorney_fio].split(" ")
      @user = User.where(lastname: fio[0], firstname: fio[1], secondname: fio[2]).first
    end
  end
  
  def search
  end
end
