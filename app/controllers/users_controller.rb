# encoding: UTF-8

class UsersController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!
  
  # GET /users
  # GET /users.json
  def index
    if params[:dom].present?
      @domain = Domain.find params[:dom]
      @users = User.with_role :attorney
      @users = @users.map { |user| user if user.has_role? :attorney, @domain }
    else
      @users = User.all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

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
    respond_to do |format|
      if @user.update_attributes(params[:user])
    if current_user.admin?
      if params[:domain].present?
        domains = params[:domain].keys
        domains.each do |domain|
          @user.grant :attorney, Domain.find(domain.to_i)
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
end
