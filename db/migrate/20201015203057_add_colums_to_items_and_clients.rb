class AddColumsToItemsAndClients < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :color, :string
    add_column :clients, :rfc, :string
  end
end
