class AddMaintenanceDateToItems < ActiveRecord::Migration
  def change
    add_column :items, :maintenance_date, :date
    add_column :items, :maintenance_done, :boolean
  end
end
