desc 'Data importing...'
task :data_import => :environment do
  puts 'Start......'
  n = 0
  files = Dir.glob("data2/*")
  files.each do |file|
    filename = file.split('/')[1]
    name, color = filename.split('-')
    c = Category.create!(name:name, color:color)
    text = File.read("#{Rails.root}/data2/#{filename}")
    text.split('|=|=|').each do |str|
      title, body = str.split('####')
      Article.create!(title:title, body:body, category_id:c.id)
      n += 1
      puts n.to_s
    end
  end
  puts 'Done.......'
end