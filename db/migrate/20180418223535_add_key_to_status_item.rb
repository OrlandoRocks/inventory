class AddKeyToStatusItem < ActiveRecord::Migration
  def change
    add_column :status_items, :key, :string
  end
end
