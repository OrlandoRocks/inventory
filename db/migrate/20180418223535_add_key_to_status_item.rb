class AddKeyToStatusItem < ActiveRecord::Migration[5.0]
  def change
    add_column :status_items, :key, :string
  end
end
