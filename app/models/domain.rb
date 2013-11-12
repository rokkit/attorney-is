class Domain < ActiveRecord::Base
  resourcify
  attr_accessible :distinct_id, :name, :address, :phone, :email, :city, :fio_major
  has_many :meetings

end
