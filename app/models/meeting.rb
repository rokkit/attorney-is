class Meeting < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :status, :title, :will_be_on, :user
end
