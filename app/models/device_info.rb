class DeviceInfo < ActiveRecord::Base
  attr_accessible :device_token
  
  validates_presence_of :device_token
end
