class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories, :force => true do |t|
      t.string :name,             :null => false
      t.integer :parent_id
      t.integer :articles_count,  :default => 0
      t.integer :sort,            :default => 0
      t.string :color

      t.timestamps
    end
    
    add_index :categories, :parent_id
    add_index :categories, :sort
  end
end
