class Article < ActiveRecord::Base
  attr_accessible :body, :sort, :title, :category_id
  
  belongs_to :category, :counter_cache => true, :inverse_of => :articles
  
  validates_presence_of :title, :body, :category_id
  
end
