# encoding: UTF-8

class RequestMeetingsController < ApplicationController
  #load_and_authorize_resource
  before_filter :authenticate_user!
  
  # GET /request_meetings
  # GET /request_meetings.json
  def index
    if current_user.admin?
      if params[:dom].present?
        @request_meetings = RequestMeeting.includes(:meeting).where(meetings: { domain_id: params[:dom] })#.per(50).page(params[:page])
        @domain = Domain.find params[:dom]
      else
        @request_meetings = RequestMeeting.all
      end
    else 
      @request_meetings = current_user.request_meetings
      if params[:dom].present?
        @request_meetings.where(meetings: { domain_id: params[:dom] })
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @request_meetings }
    end
  end

  # GET /request_meetings/1
  # GET /request_meetings/1.json
  def show
    @request_meeting = RequestMeeting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @request_meeting }
    end
  end

  # GET /request_meetings/new
  # GET /request_meetings/new.json
  def new
    @request_meeting = RequestMeeting.new params[:request_meeting]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @request_meeting }
    end
  end

  # GET /request_meetings/1/edit
  def edit
    @request_meeting = RequestMeeting.find(params[:id])
  end

  # POST /request_meetings
  # POST /request_meetings.json
  def create
    @request_meeting = RequestMeeting.new(params[:request_meeting])
    @request_meeting.user = current_user
    respond_to do |format|
      if @request_meeting.save
        format.html { redirect_to @request_meeting, notice: 'Заявка подана. Ожидается подтверждение администратором' }
        format.json { render json: @request_meeting, status: :created, location: @request_meeting }
      else
        format.html { render action: "new" }
        format.json { render json: @request_meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /request_meetings/1
  # PUT /request_meetings/1.json
  def update
    @request_meeting = RequestMeeting.find(params[:id])

    respond_to do |format|
      if @request_meeting.update_attributes(params[:request_meeting])
        format.html { redirect_to @request_meeting, notice: 'Request meeting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @request_meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_meetings/1
  # DELETE /request_meetings/1.json
  def destroy
    @request_meeting = RequestMeeting.find(params[:id])
    @request_meeting.destroy

    respond_to do |format|
      format.html { redirect_to request_meetings_url }
      format.json { head :no_content }
    end
  end
  
  def approve
    @request_meeting = RequestMeeting.find(params[:id])
    @request_meeting.approve!
    respond_to do |format|
        format.html { redirect_to @request_meeting, notice: 'Заявка успешно подтверждена' }
        format.json { render json: @request_meeting, status: :created, location: @request_meeting }
    end
  end
  #def confirm
    #@request_meeting = RequestMeeting.find(params[:id])
    #@request_meeting.confirm! params[:confirm_token]
    #respond_to do |format|
        #format.html { redirect_to @request_meeting, notice: 'Заявка успешно подтверждена' }
        #format.json { render json: @request_meeting, status: :created, location: @request_meeting }
    #end
  #end
  def cancel
    @request_meeting = RequestMeeting.find(params[:id])
    @request_meeting.cancel!
    respond_to do |format|
        format.html { redirect_to @request_meeting, notice: 'Заявка отменена' }
        format.json { render json: @request_meeting, status: :created, location: @request_meeting }
    end
  end
end
