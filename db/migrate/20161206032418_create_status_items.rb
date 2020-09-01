class CreateStatusItems < ActiveRecord::Migration[5.0]
  def change
    create_table :status_items do |t|
      t.string :name
      t.text :description
      t.boolean :status

      t.timestamps null: false
    end
  end
end
