class DomainsController < ApplicationController

  before_filter :authenticate_user!

  # GET /domains
  # GET /domains.json
  def index
    if can? :read, :all
     @domains = Domain.all
    else
     @domains = current_user.roles.map do |role| 
       unless role.resource_id.nil?
         if (role.start_date.nil? || role.start_date <= DateTime.now) && (role.end_date.nil? || role.end_date >= DateTime.now) 
           Domain.find role.resource_id 
         end
       end
     end.compact
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @domains }
    end
  end
  def admin_index
    @domains = Domain.all
  end

  # GET /domains/1
  # GET /domains/1.json
  def show
    @domain = Domain.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @domain }
    end
  end

  # GET /domains/new
  # GET /domains/new.json
  def new
    @domain = Domain.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @domain }
    end
  end

  # GET /domains/1/edit
  def edit
    @domain = Domain.find(params[:id])
  end

  # POST /domains
  # POST /domains.json
  def create
    @domain = Domain.new(params[:domain])

    respond_to do |format|
      if @domain.save
        format.html { redirect_to admin_index_domains_path, notice: 'Успешно добавлено' }
        format.json { render json: @domain, status: :created, location: @domain }
      else
        format.html { render action: "new" }
        format.json { render json: @domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /domains/1
  # PUT /domains/1.json
  def update
    @domain = Domain.find(params[:id])

    respond_to do |format|
      if @domain.update_attributes(params[:domain])
        format.html { redirect_to admin_index_domains_path, notice: 'Успешно обновлено' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /domains/1
  # DELETE /domains/1.json
  def destroy
    @domain = Domain.find(params[:id])
    @domain.destroy

    respond_to do |format|
      format.html { redirect_to admin_index_domains_path }
      format.json { head :no_content }
    end
  end
end
