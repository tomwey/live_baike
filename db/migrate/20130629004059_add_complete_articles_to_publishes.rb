class AddCompleteArticlesToPublishes < ActiveRecord::Migration
  def change
    add_column :publishes, :complete_articles, :integer, :default => 0
  end
end
