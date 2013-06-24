require 'apns'
class Notification < ActiveRecord::Base
  attr_accessible :content
  
  validates_presence_of :content
  
  has_and_belongs_to_many :device_infos
  
  before_create :save_device_infos
  def save_device_infos
    
    notifications = []
    
    DeviceInfo.all.each do |device_info|
      self.device_infos << device_info
      
      n = APNS::Notification.new(device_info.device_token, :alert => self.content, :sound => 'default')
      notifications << n
    end
    
    if notifications.any?
      APNS.send_notifications(notifications)
    end
    
  end
  
end
