class Photo < ActiveRecord::Base
  attr_accessible :image
  
  belongs_to :article
  
  mount_uploader :image, PhotoUploader
end
