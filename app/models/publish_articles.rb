# coding: utf-8
module PublishArticles
  def self.publish
    
    @publish = Publish.where(:publish_type => 1).order('created_at DESC').first
    if @publish
      puts Time.now.to_s + ' starting...'
      @publish.publish
    end
    
  end
end