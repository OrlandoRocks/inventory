class AddCategoriesToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :trailer_length, foreign_key: true
    add_reference :items, :trailer_height, foreign_key: true
    add_reference :items, :ramp_type, foreign_key: true
    add_reference :items, :redila_type, foreign_key: true
    add_reference :items, :trailer_type, foreign_key: true
    add_reference :items, :floor_type, foreign_key: true
    add_reference :items, :capacity, foreign_key: true
    add_column :items, :duck_tail, :boolean
    add_column :items, :gooseneck, :boolean
  end
end
