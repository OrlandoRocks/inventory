class CreateItemFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :item_files do |t|
      t.references :item, index: true, foreign_key: true
      t.string :file
      t.integer :file_type
      t.string :description

      t.timestamps null: false
    end
  end
end
