# encoding: UTF-8
class MeetingsController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => :request_for_meeting
  before_filter :authenticate_user!
  before_filter :load_domain, only: [:index, :new, :create, :calendar]
  # GET /meetings
  # GET /meetings.json
  
  def calendar
    d1 = Date.parse('jan 1 2011')
    d2 = Date.parse('dec 31 2012')
    @year = params[:year] || Date.today.year
    @months = (d1..d2).map{ |m| m.strftime('%Y%m') }.uniq.map{ |m| Date::ABBR_MONTHNAMES[ Date.strptime(m, '%Y%m').mon ] }
  end
  
  def index
    @meetings = @domain.meetings
    @meetings_by_date = @meetings.group_by(&:will_be_on)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meetings }
    end
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    @meeting = Meeting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @meeting }
      format.js
    end
  end

  # GET /meetings/new
  # GET /meetings/new.json
  def new
    @meeting = Meeting.new params[:meeting]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @meeting }
      format.js
    end
  end

  # GET /meetings/1/edit
  def edit
    @meeting = Meeting.find(params[:id])
  end

  # POST /meetings
  # POST /meetings.json
  def create

    @meeting = Meeting.new(params[:meeting])
    @meeting.domain = @domain
    respond_to do |format|
      if @meeting.save
        format.html { redirect_to @meeting, notice: 'Заседание успено добавлено' }
        format.json { render json: @meeting, status: :created, location: @meeting }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /meetings/1
  # PUT /meetings/1.json
  def update
    @meeting = Meeting.find(params[:id])

    respond_to do |format|
      if @meeting.update_attributes(params[:meeting])
        format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy

    respond_to do |format|
      format.html { redirect_to meetings_url }
      format.json { head :no_content }
    end
  end
  
  def request_for_meeting
    p = Hash.new
    p[:request_meeting] = Hash.new
    p[:request_meeting][:meeting_id] = params[:id]
    redirect_to new_request_meeting_path p
  end

  def load_domain
    @domain = Domain.find params[:domain_id]
  end
end
