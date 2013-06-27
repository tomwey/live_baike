# coding: utf-8
module PublishArticles
  def self.publish
    
    @publish = Publish.where(:publish_type => 1).order('created_at DESC').first
    puts 'Starting...'
    if @publish
      @publish.publish
    end
    
  end
end