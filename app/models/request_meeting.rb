# encoding: UTF-8
class RequestMeeting < ActiveRecord::Base
  belongs_to :user
  belongs_to :meeting
  attr_accessible :status, :meeting_id
  
  before_create :set_status
  after_create :send_inform

  validates :user, :meeting, :presence => true
  
  def set_status
    self.status = 1 #заявка подана
  end
  
  def approve!
    self.status = 2 #заявка подтвержена администратором
    self.meeting.user = self.user
    self.meeting.save!
    if save!
      inform "Вы включены в график дежурств на #{self.meeting.will_be_at}"
    end
  end

  
  def cancel!
    InformMailer.cancel_request(self).deliver
    date = self.meeting.will_be_at
    if destroy
      inform "Ваша заявка на дежурство #{date} отклонена"
    end
  end
  
  def send_inform
    InformMailer.incomin_request(self).deliver
  end
  
private 
  def inform message
          #client = Twilio::REST::Client.new(APP['twilio']['sid'], APP['twilio']['token'])
          #client.account.sms.messages.create(
            #from: APP['twilio']['from'],
            #to: "+#{user.phone}",
            #body: message
          #)
          Sms.inform user.phone, message
          InformMailer.inform(self, message).deliver 
  end
end
