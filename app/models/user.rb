class User < ActiveRecord::Base
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
  :admin
  
  validates :email, :fio, :register_number, :phone, :presence => true
  before_validation :strip_whitespace 
  has_many :meetings
  has_many :request_meetings
  has_and_belongs_to_many :roles
  
  def admin?
    self.admin
  end
  
  def to_s
    fio
  end

  def strip_whitespace
    self.fio = self.fio.strip
  end
  # before_validation :set_password, on: :create
  # 
  # private 
  #   def set_password
  #     o =  [('a'..'z'), ('A'..'Z'), (0..9)].map{|i| i.to_a}.flatten
  #     self.password = self.password_confirmation = (0..16).map{ o[rand(o.length)] }.join if self.password.blank?
  #     RegistrationMailer.welcome(user, generated_password).deliver
  #   end
  # attr_accessible :title, :body
end
