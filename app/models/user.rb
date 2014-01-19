class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable, :timeoutable
         

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
  :fio,
  :birthdate,
  :register_number,
  :phone,
  :address,
  :admin,
  :request_limit, :role_ids, :roles, :attorney_formation, :attorney_consult, :avatar, :start_access, :end_access,
  :lastname, :firstname, :secondname
  
  validates :email, :register_number, :phone,:request_limit, :firstname, :lastname, :presence => true
  validates :email, uniqueness: true
  validates :request_limit, :phone, numericality: {greater_than: 0}
  before_validation :strip_whitespace 
  has_many :meetings
  has_many :request_meetings
  has_many :inform_mails
  belongs_to :attorney_formation
  
  mount_uploader :avatar, AvatarUploader
  def admin?
    has_role? :admin
  end
  
  
  def to_s
    "#{roles.first} #{fio}"
  end
  
  def fio
    "#{lastname} #{firstname} #{secondname}"
  end
  
  def autocomplete_display
    "#{fio} #{register_number_with_region}"
  end
  def register_number_with_region
    "78/#{register_number}"
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
  
  def start_access_to(domain)
    self.roles.bsearch {|role| role.resource_id == domain.id}.try { |s| s.start_date.strftime("%d.%m.%Y") }
  end
  
  def end_access_to(domain)
    self.roles.bsearch {|role| role.resource_id == domain.id}.try { |s| s.end_date.strftime("%d.%m.%Y") }
  end
  
  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      product = find_by_id(row["id"]) || new
      product.attributes = row.to_hash.slice(*accessible_attributes)
      product.add_role(:attorney)
      product.email = (0...20).map{ ('a'..'z').to_a[rand(26)] }.join
      product.request_limit = 10
      product.save!(validate: false)
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path, csv_options: {col_sep: ";"})
    when ".xls" then Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
  
   before_validation :set_password, on: :create
   
     def set_password
       #o =  [('a'..'z'), ('A'..'Z'), (0..9)].map{|i| i.to_a}.flatten
       generated_password = Devise.friendly_token.first(8) #(0..16).map{ o[rand(o.length)] }.join# if self.password.blank?
       self.password = self.password_confirmation = generated_password
        # Registration.welcome(self, generated_password).deliver
        # Sms.inform self.phone, "Ваш пароль: #{generated_password}"
     end
end
