set :output, "/var/log/crontab.log"

every 2.minutes do 
  rake "data:test"
end
