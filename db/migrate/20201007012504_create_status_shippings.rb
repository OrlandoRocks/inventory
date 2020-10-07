class CreateStatusShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :status_shippings do |t|
      t.string :name
      t.text :description
      t.boolean :status
      t.string :key

      t.timestamps
    end
  end
end
