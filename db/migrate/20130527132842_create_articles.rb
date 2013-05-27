class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles, :force => true do |t|
      t.string :title, :null => false
      t.text :body,    :null => false
      t.integer :sort, :default => 0
      t.integer :category_id

      t.timestamps
    end
    
    add_index :articles, :category_id
    add_index :articles, :sort
  end
end
