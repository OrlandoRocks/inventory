class AddWeightToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :item_weight, :decimal
    add_column :items, :total_weight, :decimal
  end
end
