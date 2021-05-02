class CreateSpareParts < ActiveRecord::Migration[5.2]
  def change
    create_table :spare_parts do |t|
      t.references :sub_category, foreign_key: true
      t.decimal :instock
      t.decimal :unit_cost
      t.string :measurement

      t.timestamps
    end
  end
end
