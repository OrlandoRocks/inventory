class CreateBranches < ActiveRecord::Migration[5.0]
  def change
    create_table :branches do |t|
      t.string :name
      t.string :description
      t.references :city, index: true, foreign_key: true
      t.references :company, index: true, foreign_key: true
      t.integer :manager_id

      t.timestamps null: false
    end
  end
end
