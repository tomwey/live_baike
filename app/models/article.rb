# coding: utf-8
class Article < ActiveRecord::Base
  attr_accessible :body, :sort, :title, :category_id, :image,:remove_image, :status # 0:待审核, 1:已发布, 2:已审核, 3:未通过
  
  # attr_protected :status
  
  belongs_to :category, :counter_cache => true, :inverse_of => :articles
  has_many :photos
  
  validates_presence_of :title, :body, :category_id
  
  STATES = [['待审核', 0], ['已审核', 2], ['未通过', 3], ['已发布', 1]]
  
  # default_scope order('created_at DESC')
  scope :visible, where(:status => 1)
  scope :without_body, except(:body)
  scope :latest, order('access_time DESC')
  scope :approved, where(:status => 2)
  
  mount_uploader :image, PhotoUploader
  
  def publish
    self.status = 1
    self.access_time = Time.now.to_i
    self.save!
  end
  
  def self.latest_title_list(time, mode)
    
    if time <= 0
      visible.latest.without_body
    else
      if mode == 0
        where('access_time < ? and status=1', time).latest.without_body
      else
        where('access_time > ? and status=1', time).latest.without_body
      end
    end
    
  end
  
end
