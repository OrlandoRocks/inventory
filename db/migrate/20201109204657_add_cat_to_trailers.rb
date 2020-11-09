class AddCatToTrailers < ActiveRecord::Migration[5.2]
  def change
    add_reference :trailers, :trailer_length, foreign_key: true
    add_reference :trailers, :trailer_height, foreign_key: true
    add_reference :trailers, :trailer_width, foreign_key: true
    add_reference :trailers, :ramp_type, foreign_key: true
    add_reference :trailers, :redila_type, foreign_key: true
    add_reference :trailers, :floor_type, foreign_key: true
    add_reference :trailers, :capacity, foreign_key: true
    add_reference :trailers, :color, foreign_key: true
    add_reference :trailers, :hydraulic_jack, foreign_key: true
    add_reference :trailers, :pull_type, foreign_key: true
    add_reference :trailers, :brake_type, foreign_key: true
    add_reference :trailers, :reinforcement_type, foreign_key: true
    add_reference :trailers, :fender_type, foreign_key: true
    add_reference :trailers, :turn_type, foreign_key: true
    add_reference :trailers, :divition_type, foreign_key: true
    add_reference :trailers, :suspension_type, foreign_key: true
    add_reference :trailers, :roof_type, foreign_key: true
  end
end
