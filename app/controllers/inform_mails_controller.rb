class InformMailsController < ApplicationController
  # GET /inform_mails
  # GET /inform_mails.json
  def index
    if current_user.admin? 
      @inform_mails = InformMail.order("created_at DESC")
    else
      @inform_mails = current_user.inform_mails.order("created_at DESC")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @inform_mails }
    end
  end

  # GET /inform_mails/1
  # GET /inform_mails/1.json
  def show
    @inform_mail = InformMail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @inform_mail }
    end
  end

  # GET /inform_mails/new
  # GET /inform_mails/new.json
  def new
    @inform_mail = InformMail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @inform_mail }
    end
  end

  # GET /inform_mails/1/edit
  def edit
    @inform_mail = InformMail.find(params[:id])
  end

  # POST /inform_mails
  # POST /inform_mails.json
  def create
    @inform_mail = InformMail.new(params[:inform_mail])

    respond_to do |format|
      if @inform_mail.save
        format.html { redirect_to @inform_mail, notice: 'Inform mail was successfully created.' }
        format.json { render json: @inform_mail, status: :created, location: @inform_mail }
      else
        format.html { render action: "new" }
        format.json { render json: @inform_mail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /inform_mails/1
  # PUT /inform_mails/1.json
  def update
    @inform_mail = InformMail.find(params[:id])

    respond_to do |format|
      if @inform_mail.update_attributes(params[:inform_mail])
        format.html { redirect_to @inform_mail, notice: 'Inform mail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @inform_mail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inform_mails/1
  # DELETE /inform_mails/1.json
  def destroy
    @inform_mail = InformMail.find(params[:id])
    @inform_mail.destroy

    respond_to do |format|
      format.html { redirect_to inform_mails_url }
      format.json { head :no_content }
    end
  end
end
