class Domain < ActiveRecord::Base
  resourcify
  attr_accessible :distinct_id, :name, :address, :phone
  has_many :meetings

end
