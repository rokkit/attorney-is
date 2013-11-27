class AttorneyFormationsController < ApplicationController
  # GET /attorney_formations
  # GET /attorney_formations.json
  def index
    @attorney_formations = AttorneyFormation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attorney_formations }
    end
  end

  # GET /attorney_formations/1
  # GET /attorney_formations/1.json
  def show
    @attorney_formation = AttorneyFormation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attorney_formation }
    end
  end

  # GET /attorney_formations/new
  # GET /attorney_formations/new.json
  def new
    @attorney_formation = AttorneyFormation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attorney_formation }
    end
  end

  # GET /attorney_formations/1/edit
  def edit
    @attorney_formation = AttorneyFormation.find(params[:id])
  end

  # POST /attorney_formations
  # POST /attorney_formations.json
  def create
    @attorney_formation = AttorneyFormation.new(params[:attorney_formation])

    respond_to do |format|
      if @attorney_formation.save
        format.html { redirect_to @attorney_formation, notice: 'Attorney formation was successfully created.' }
        format.json { render json: @attorney_formation, status: :created, location: @attorney_formation }
      else
        format.html { render action: "new" }
        format.json { render json: @attorney_formation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attorney_formations/1
  # PUT /attorney_formations/1.json
  def update
    @attorney_formation = AttorneyFormation.find(params[:id])

    respond_to do |format|
      if @attorney_formation.update_attributes(params[:attorney_formation])
        format.html { redirect_to @attorney_formation, notice: 'Attorney formation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attorney_formation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attorney_formations/1
  # DELETE /attorney_formations/1.json
  def destroy
    @attorney_formation = AttorneyFormation.find(params[:id])
    @attorney_formation.destroy

    respond_to do |format|
      format.html { redirect_to attorney_formations_url }
      format.json { head :no_content }
    end
  end
end
