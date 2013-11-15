class InformMail < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :sms_body, :user, :user_id, :sender_id
  
  after_create :send_email_and_sms
  
  belongs_to :sender, :class_name => "User", :foreign_key => "sender_id"
  
   
   
   def self.io_type(t, user)
     if t == 'input'
       where(user_id: user)
     elsif t == 'output'
       where(sender_id: user)
     end
   end
  
  private
  
  def send_email_and_sms
    Sms.inform user.phone, sms_body if sms_body.present?
    InformMailer.inform(user.email, body).deliver if body.present?
  end
end
