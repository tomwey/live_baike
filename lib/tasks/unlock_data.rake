namespace :data do
  desc 'Open article...'
  task :unlock => :environment do
    count = 30 + rand(21)
    @articles = Article.where(:status => 0).order('RANDOM()').limit(2)
    @articles.each do |article|
      article.status = 1
      puts article.title + '-----------'
      article.access_time = Time.now.to_i
      article.save!
      sleep(1)
    end
    puts 'Done...'
  end
  
  desc 'Test schedule...'
  task :test => :environment do
    puts 'Test schedule ' + Time.now.to_s
  end
end