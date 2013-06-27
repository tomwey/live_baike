# coding: utf-8
class CreatePublishes < ActiveRecord::Migration
  def change
    create_table :publishes do |t|
      t.datetime :published_at
      t.integer :articles_count, :default => 15
      t.integer :type, :default => 0 # 手动
      t.integer :category_id

      t.timestamps
    end
  end
end
