class TrailerCategory < ApplicationRecord
  belongs_to :trailer, optional: true
  belongs_to :trailer_length, optional: true
  belongs_to :trailer_height, optional: true
  belongs_to :ramp_type, optional: true
  belongs_to :redila_type, optional: true
  belongs_to :trailer_type
  belongs_to :floor_type, optional: true
  belongs_to :capacity, optional: true
  belongs_to :trailer_width, optional: true
  belongs_to :color, optional: true
  belongs_to :hydraulic_jack, optional: true
  belongs_to :pull_type, optional: true
  belongs_to :brake_type, optional: true
  belongs_to :reinforcement_type, optional: true
  belongs_to :fender_type, optional: true
  belongs_to :turn_type, optional: true
  belongs_to :divition_type, optional: true
  belongs_to :suspension_type, optional: true
  belongs_to :roof_type, optional: true
  belongs_to :brand, optional: true
end