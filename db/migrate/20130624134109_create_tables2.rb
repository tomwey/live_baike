class CreateTables2 < ActiveRecord::Migration
  def change
    create_table :device_infos_notifications, :force => false do |t|
      t.integer :notification_id
      t.integer :device_info_id
    end
  end
  
end
