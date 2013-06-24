class DeviceInfo < ActiveRecord::Base
  attr_accessible :device_token
  
  validates_presence_of :device_token
  validates_uniqueness_of :device_token
  
  has_and_belongs_to_many :notifications
  
end
