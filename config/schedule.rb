set :output, File.join(Whenever.path, 'log', 'crontab.log')
# set :environment, "development"

every 1.day, :at => '4:30 am' do 
  runner "PublishArticles.publish"
end
