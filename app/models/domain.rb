class Domain < ActiveRecord::Base
  resourcify
  attr_accessible :distinct_id, :name
  has_many :meetings

end
