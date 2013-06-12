class Article < ActiveRecord::Base
  attr_accessible :body, :sort, :title, :category_id
  
  belongs_to :category, :counter_cache => true, :inverse_of => :articles
  
  validates_presence_of :title, :body, :category_id
  
  default_scope order('created_at DESC')
  
  def self.latest_title_list(aid, mode)
    
    if aid <= 0
      order('created_at DESC').except(:body)
    else
      if mode == 0
        where('id < ?', aid).except(:body)
      else
        where('id > ?', aid).except(:body)
      end
    end
    
  end
  
end
