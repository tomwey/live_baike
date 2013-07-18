require 'apns'

host = Rails.env.development? ? "sandbox." : ""

APNS.host = "gateway.push.apple.com"#"gateway.#{host}push.apple.com"

cert = "livebaike_cert.pem"#Rails.env.development? ? "cert.pem" : "livebaike_cert.pem"
APNS.pem = "#{Rails.root}/config/#{cert}"

# puts APNS.host + ' -- ' + APNS.pem

APNS.pass = "KeKe20130206"

APNS.port = 2195

# 
# # (default: feedback.sandbox.push.apple.com)
# APNS.feedback_host = 'feedback.sandbox.push.apple.com'
# 
# # (default: 2196)
# APNS.feedback_port = 2196