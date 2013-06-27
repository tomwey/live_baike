# coding: utf-8
module PublishArticles
  def self.publish
    
    @publish = Publish.where(:publish_type => 1).order('created_at DESC').first
    if @publish
      puts 'Starting...'
      @publish.publish
    end
    
  end
end