class CreateQuotations < ActiveRecord::Migration[5.2]
  def change
    create_table :quotations do |t|

      t.references :user, index: true, foreign_key: true
      # t.catalog :integer
      t.decimal :price
      t.string :model

      t.references :client, index: true, foreign_key: true
      t.references :branch, index: true, foreign_key: true
      t.references :department, index: true, foreign_key: true
      t.references :trailer_type, index: true, foreign_key: true
      t.references :brake_type, index: true, foreign_key: true
      t.references :trailer_width, index: true, foreign_key: true
      t.references :color, index: true, foreign_key: true
      t.references :trailer_length, index: true, foreign_key: true
      t.references :divition_type, index: true, foreign_key: true
      t.references :floor_type, index: true, foreign_key: true
      t.references :fender_type, index: true, foreign_key: true
      t.references :ramp_type, index: true, foreign_key: true
      t.references :hydraulic_jack, index: true, foreign_key: true
      t.references :capacity, index: true, foreign_key: true
      t.references :pull_type, index: true, foreign_key: true
      t.references :redila_type, index: true, foreign_key: true
      t.references :brand, index: true, foreign_key: true
      t.references :roof_type, index: true, foreign_key: true
      t.references :suspension_type, index: true, foreign_key: true
      t.references :turn_type, index: true, foreign_key: true
      t.string :accessory
      t.string :categories_description
      t.integer :catalog

      t.timestamps
    end
  end
end
