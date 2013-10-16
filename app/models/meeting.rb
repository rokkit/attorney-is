# encoding: UTF-8

class Meeting < ActiveRecord::Base
  belongs_to :user
  belongs_to :domain
  attr_accessible :content, :status, :title, :will_be_on, :will_be_at, :user, :judge, :client

  
  validates :will_be_on, :will_be_at, presence: true
  has_many :request_meetings
  def to_s
    "Заседание #{will_be_on}"
  end
end
