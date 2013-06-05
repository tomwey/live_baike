class Category < ActiveRecord::Base
  attr_accessible :color, :name, :sort
  
  acts_as_tree
  
  has_many :articles, :dependent => :destroy, :inverse_of => :category
  
  validates_presence_of :name
  
  
  def self.all_categories
    Category.all.collect { |category| [category.name, category.id] }
  end
end
