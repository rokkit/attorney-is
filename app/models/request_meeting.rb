# encoding: UTF-8
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
    self.status = 2 #заявка подтвержена администратором и ожидается подтверждение по телефону
    self.confirm_token = Devise.friendly_token.first(6)
    if save!
      inform "#{self.confirm_token}"
    end
  end

  def confirm! token
    if self.confirm_token == token
      
      self.status = 3
      meeting = Meeting.find(self.meeting)
      meeting.user = self.user
      meeting.save!
      save!
    end
  end
  
  def cancel!
    InformMailer.cancel_request(self).deliver
    destroy!
    inform "отклонена"
  end
  
  def send_inform
    InformMailer.incomin_request(self).deliver
  end
  
private 
  def inform message
          client = Twilio::REST::Client.new(APP['twilio']['sid'], APP['twilio']['token'])
          client.account.sms.messages.create(
            from: APP['twilio']['from'],
            to: "+#{user.phone}",
            body: "Ваша заявка на заседание #{meeting.will_be_on}  #{ meeting.will_be_at} #{message}"
          )
          InformMailer.inform(self, message).deliver 
  end
end
