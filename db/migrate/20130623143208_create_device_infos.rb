class CreateDeviceInfos < ActiveRecord::Migration
  def change
    create_table :device_infos do |t|
      t.string :device_token

      t.timestamps
    end
  end
end
