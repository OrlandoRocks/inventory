class CreateItemsMaintenances < ActiveRecord::Migration
  def change
    create_table :items_maintenances do |t|
      t.references :item, index: true, foreign_key: true
      t.string :file
      t.references :maintenance, index: true, foreign_key: true
      t.text :description
      t.decimal :price
      t.string :provider

      t.timestamps null: false
    end
  end
end
