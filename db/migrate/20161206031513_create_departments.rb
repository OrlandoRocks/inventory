class CreateDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :departments do |t|
      t.string :name
      t.text :description
      t.references :branch, index: true, foreign_key: true
      t.integer :manager_id

      t.timestamps null: false
    end
  end
end
