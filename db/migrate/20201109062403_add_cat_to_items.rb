class AddCatToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :color, foreign_key: true
    add_reference :items, :hydraulic_jack, foreign_key: true
    add_reference :items, :pull_type, foreign_key: true
    add_reference :items, :brake_type, foreign_key: true
    add_reference :items, :reinforcement_type, foreign_key: true
    add_reference :items, :fender_type, foreign_key: true
    add_reference :items, :turn_type, foreign_key: true
    add_reference :items, :divition_type, foreign_key: true
    add_reference :items, :suspension_type, foreign_key: true
    add_reference :items, :roof_type, foreign_key: true
  end
end
