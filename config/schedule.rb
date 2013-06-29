Time.zone = 'Beijing'
set :output, File.join(Whenever.path, 'log', 'crontab.log')
# set :environment, "development"

every 1.day, :at => Time.zone.parse('4:00 am').localtime do 
  runner "PublishArticles.publish"
end
