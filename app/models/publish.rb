# coding: utf-8
class Publish < ActiveRecord::Base
  attr_accessible :articles_count, :category_id, :published_at, :publish_type
  
  validates_presence_of :articles_count
  
  TYPES = [['手动', 0], ['自动', 1]]
  
  before_save :publish_articles
  def publish_articles
    if publish_type.to_i == 0
      self.publish
    end
  end
  
  def publish
    @category = Category.find_by_id(category_id)
    
    if @category
      @articles = @category.articles.approved.order('RANDOM()').limit(articles_count)
    else
      @articles = Article.approved.order('RANDOM()').limit(articles_count)
    end
    
    self.articles_count = @articles.size
    if not new_record?
      self.save!
    end
    
    @articles.each do |article|
      article.publish
      sleep(1)
    end
    puts 'Done...'
    
  end
  
end
