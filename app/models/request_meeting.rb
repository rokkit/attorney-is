class RequestMeeting < ActiveRecord::Base
  belongs_to :user
  belongs_to :meeting
  attr_accessible :status, :meeting_id
  
  before_create :set_status
  after_create :send_inform
  
  def set_status
    self.status = 1 #заявка подана
  end
  
  def approve!
    self.status = 2
    save!
    InformMailer.approve_request(self).deliver
  end
  
  def send_inform
    InformMailer.incomin_request(self).deliver
  end
end
