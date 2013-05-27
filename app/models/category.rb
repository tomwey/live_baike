class Category < ActiveRecord::Base
  attr_accessible :color, :name, :sort
  
  acts_as_tree
  
  has_many :articles, :dependent => :destroy, :inverse_of => :category
  
  validates_presence_of :name
  
end
