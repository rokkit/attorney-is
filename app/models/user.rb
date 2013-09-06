class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
  :fio,
  :birthdate,
  :register_number,
  :phone,
  :address,
  :admin,
  :request_limit
  
  validates :email, :fio, :register_number, :phone,:request_limit, :presence => true
  validates :request_limit, :phone, numericality: {greater_than: 0}
  before_validation :strip_whitespace 
  has_many :meetings
  has_many :request_meetings
  
  def admin?
    has_role? :admin
  end
  
  def to_s
    fio
  end

  def strip_whitespace
    self.fio = self.fio.strip
  end

  def decrement_request_limit
    if self.request_limit > 1
      self.decrement! :request_limit
      return true
    else
      raise Exception.new "Limit end"
    end
  end
   before_validation :set_password, on: :create
   
   private 
     def set_password
       #o =  [('a'..'z'), ('A'..'Z'), (0..9)].map{|i| i.to_a}.flatten
       generated_password = Devise.friendly_token.first(8) #(0..16).map{ o[rand(o.length)] }.join# if self.password.blank?
       self.password = self.password_confirmation = generated_password
        Registration.welcome(self, generated_password).deliver
        Sms.inform self.phone, "Ваш пароль: #{generated_password}"
     end
end
