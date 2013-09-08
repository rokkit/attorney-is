class Domain < ActiveRecord::Base
  attr_accessible :distinct_id, :name
  has_many :meetings
end
