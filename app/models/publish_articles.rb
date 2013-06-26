# coding: utf-8
module PublishArticles
  def self.random_publish(category_id, size = 30)
    
    @category = Category.find_by_id(category_id)
    
    if @category
      @articles = @category.articles.approved.order('RANDOM()').limit(size)
    else
      @articles = Article.approved.order('RANDOM()').limit(size)
    end
    
    @articles.each do |article|
      article.publish
      sleep(1)
    end
    puts 'Done...'
    
  end
  
end