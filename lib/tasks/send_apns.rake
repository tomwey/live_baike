# coding: utf-8
require 'apns'
namespace :apns do
  desc 'Sending to apns...'
  task :send => :environment do
    tokens = %w[333411aef3291f01a88e2ea46e4194bfe580b6e510fe9e0708ef537d52485d09 9f1418513222308a905088bd1ac15636f74b343e59830ab21cfbbb5b14fe91e4]
    
    tokens.each do |device_token|
      APNS.send_notification(device_token, :alert => '屌爆了，有没有？', :badge => 100, :sound => 'default')
    end
    
  end
end