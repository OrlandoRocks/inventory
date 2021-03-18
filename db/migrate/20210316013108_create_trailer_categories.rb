class CreateTrailerCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :trailer_categories do |t|
      t.references :trailer, foreign_key: true
      t.references :trailer_length, foreign_key: true
      t.references :trailer_height, foreign_key: true
      t.references :ramp_type, foreign_key: true
      t.references :redila_type, foreign_key: true
      t.references :trailer_type, foreign_key: true
      t.references :floor_type, foreign_key: true
      t.references :capacity, foreign_key: true
      t.references :trailer_width, foreign_key: true
      t.references :color, foreign_key: true
      t.references :hydraulic_jack, foreign_key: true
      t.references :pull_type, foreign_key: true
      t.references :brake_type, foreign_key: true
      t.references :reinforcement_type, foreign_key: true
      t.references :fender_type, foreign_key: true
      t.references :turn_type, foreign_key: true
      t.references :divition_type, foreign_key: true
      t.references :suspension_type, foreign_key: true
      t.references :roof_type, foreign_key: true
      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
