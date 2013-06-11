class RequestMeeting < ActiveRecord::Base
  belongs_to :user
  belongs_to :meeting
  attr_accessible :status, :meeting_id
  
  before_create :set_status
  
  def set_status
    self.status = 1 #заявка подана
  end
end
