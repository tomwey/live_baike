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
      
      # n = Grocer::Notification.new(
      #   device_token:  device_info.device_token, 
      #   alert:         self.content,
      #   sound:         "default"
      # )
      
      n = APNS::Notification.new(device_info.device_token, :alert => self.content, :sound => "default")
      
      notifications << n
    end
    
    if notifications.any?
      APNS.send_notifications(notifications)
    end
    
    # cert = "#{Rails.root}/config/livebaike_cert.pem"
    # 
    # puts cert
    
    # pass = "KeKe20130206"
    
    # pusher = Grocer.pusher(
    #   certificate: cert,
    #   passphrase:  pass,
    #   gateway:     "gateway.push.apple.com",
    #   port:        2195,
    #   retries:     3
    # )
    
    # notifications.each do |notification|
    #   pusher.push(notification)
    # end
    
    # Feedback
    # feedback = Grocer.feedback(
    #   certificate: cert,
    #   passphrase:  pass,
    #   gateway:     "feedback.push.apple.com",
    #   port:        2196,
    #   retries:     3
    # )
    # 
    # feedback.each do |attempt|
    #   puts "Device #{attempt.device_token} failed at #{attempt.timestamp}"
    # end
    
  end
  
end
