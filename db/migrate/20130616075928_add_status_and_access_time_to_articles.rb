class AddStatusAndAccessTimeToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :status, :integer, :default => 0
    add_column :articles, :access_time, :integer
    add_index :articles, :access_time
  end
end
