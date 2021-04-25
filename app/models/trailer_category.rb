# == Schema Information
#
# Table name: trailer_categories
#
#  id                    :bigint           not null, primary key
#  trailer_id            :bigint
#  trailer_length_id     :bigint
#  trailer_height_id     :bigint
#  ramp_type_id          :bigint
#  redila_type_id        :bigint
#  trailer_type_id       :bigint
#  floor_type_id         :bigint
#  capacity_id           :bigint
#  trailer_width_id      :bigint
#  color_id              :bigint
#  hydraulic_jack_id     :bigint
#  pull_type_id          :bigint
#  brake_type_id         :bigint
#  reinforcement_type_id :bigint
#  fender_type_id        :bigint
#  turn_type_id          :bigint
#  divition_type_id      :bigint
#  suspension_type_id    :bigint
#  roof_type_id          :bigint
#  brand_id              :bigint
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  key                   :string
#

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
