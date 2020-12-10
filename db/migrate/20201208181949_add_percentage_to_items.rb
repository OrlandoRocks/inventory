class AddPercentageToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :seller_percentage, :decimal
    add_column :items, :planet_percentage, :decimal
    add_column :items, :branch_percentage, :decimal
  end
end
