class Article < ActiveRecord::Base
  attr_accessible :body, :sort, :title, :category_id, :image
  
  attr_protected :status
  
  belongs_to :category, :counter_cache => true, :inverse_of => :articles
  has_many :photos
  
  validates_presence_of :title, :body, :category_id
  
  default_scope order('created_at DESC')
  scope :visible, where(:status => 1)
  
  mount_uploader :image, PhotoUploader
  
  def self.latest_title_list(time, mode)
    
    if time <= 0
      visible.order('access_time DESC').except(:body)
    else
      if mode == 0
        puts time.to_s
        where('access_time < ? and status=1', time).order('access_time DESC').except(:body)
      else
        where('access_time > ? and status=1', time).order('access_time DESC').except(:body)
      end
    end
    
  end
  
end
