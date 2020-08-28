class AddNewColumnsToItems < ActiveRecord::Migration[5.2]
  def change

    add_column :items, :sale_price, :decimal
    add_column :items, :remission, :string
    add_column :items, :accessory, :string

  end
end
