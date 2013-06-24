require 'apns'
APNS.host = 'gateway.sandbox.push.apple.com'

APNS.pem = "#{Rails.root}/config/cert.pem"

APNS.pass = 'tomwey860818'

APNS.port = 2195
# 
# # (default: feedback.sandbox.push.apple.com)
# APNS.feedback_host = 'feedback.sandbox.push.apple.com'
# 
# # (default: 2196)
# APNS.feedback_port = 2196