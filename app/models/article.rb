class Article < ActiveRecord::Base
  attr_accessible :body, :sort, :title
  
  attr_protected :category_id
  
  belongs_to :category, :counter_cache => true, :inverse_of => :articles
  
  validates_presence_of :title, :body
  
end
