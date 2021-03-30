# == Schema Information
#
# Table name: trailer_types
#
#  id         :bigint           not null, primary key
#  name       :string
#  image      :string
#  status     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  model_part :string
#

class TrailerType < ApplicationRecord

  has_many :trilers
  has_many :trailer_category

  accepts_nested_attributes_for :trailer_category

  has_one_attached :image

end
