set :environment, 'development'
set :output, "/Users/tomwey/Desktop/cron/file.log"

every 2.minutes do 
  rake "data:unlock"
end
