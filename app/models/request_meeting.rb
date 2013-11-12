# encoding: UTF-8
class RequestMeeting < ActiveRecord::Base
  belongs_to :user
  belongs_to :meeting
  attr_accessible :status, :meeting_id
  
  before_create :set_status
  after_create :send_notification_to_admins

  validates :user, :meeting, :presence => true
  
  def set_status
    self.status = 1 #заявка подана
  end
  
  def approve!
    if self.user.decrement_request_limit()
      self.status = 2 #заявка подтвержена администратором
      self.meeting.user = self.user
      self.meeting.save!
      if save
        InformMail.create user: self.user,  
          body: "Вы включены в график дежурств на #{self.meeting.will_be_on.strftime("%d.%m.%Y")} #{self.meeting.will_be_at.strftime("%R")} в #{self.meeting.domain.name}. Клиент: #{self.meeting.client}",
          sms_body: "Вы включены в график дежурств на #{self.meeting.will_be_on.strftime("%d.%m.%Y")} #{self.meeting.will_be_at.strftime("%R")} в #{self.meeting.domain.name}. Клиент: #{self.meeting.client}"
      end
    end
  end

  
  def cancel!
    # InformMailer.cancel_request(self).deliver
    self.meeting.user = nil
    self.meeting.save
    date = self.meeting.will_be_at
    if destroy
      InformMail.create user: self.user,  
        body: "Ваша заявка отклонена. Заседание: #{self.meeting.will_be_on.strftime("%d.%m.%Y")} #{self.meeting.will_be_at.strftime("%R")} в #{self.meeting.domain.name}",
        sms_body: "Ваша заявка отклонена. Заседание: #{self.meeting.will_be_on.strftime("%d.%m.%Y")} #{self.meeting.will_be_at.strftime("%R")} в #{self.meeting.domain.name}"
    end
  end
  
  def send_notification_to_admins
    InformMail.create user: User.first,  
      body: "Новая заявка на заседание #{self.meeting.will_be_on.strftime("%d.%m.%Y")} #{self.meeting.will_be_at.strftime("%R")} в #{self.meeting.domain.name}"
  end
  
private 
  def inform message
          Sms.inform user.phone, message
          InformMailer.inform(self, message).deliver 
  end
end
