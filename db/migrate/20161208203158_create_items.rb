class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :model
      t.string :serial_number
      t.date :purchased_date
      t.date :in_service_date
      t.integer :time_unit_service
      t.decimal :time_quantity_service
      t.decimal :price
      t.integer :time_unit_depreciation
      t.decimal :time_quantity_depreciation
      t.references :sub_category, index: true, foreign_key: true
      t.references :provider, index: true, foreign_key: true
      t.references :department, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :brand, index: true, foreign_key: true
      t.references :status_item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
