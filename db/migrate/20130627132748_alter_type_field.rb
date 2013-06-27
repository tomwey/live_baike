class AlterTypeField < ActiveRecord::Migration
  def change
    rename_column :publishes, :type, :publish_type
  end
end
