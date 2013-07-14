require 'apns'

host = Rails.env.development? ? "sandbox." : ""

APNS.host = "gateway.#{host}push.apple.com"

cert = Rails.env.development? ? "cert.pem" : "production_cert.pem"
APNS.pem = "#{Rails.root}/config/#{cert}"

# puts APNS.host + ' -- ' + APNS.pem

APNS.pass = Rails.env.development? ? "tomwey860818" : ''

APNS.port = 2195

# 
# # (default: feedback.sandbox.push.apple.com)
# APNS.feedback_host = 'feedback.sandbox.push.apple.com'
# 
# # (default: 2196)
# APNS.feedback_port = 2196