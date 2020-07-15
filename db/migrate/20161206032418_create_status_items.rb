class CreateStatusItems < ActiveRecord::Migration
  def change
    create_table :status_items do |t|
      t.string :name
      t.text :description
      t.boolean :status

      t.timestamps null: false
    end
  end
end
