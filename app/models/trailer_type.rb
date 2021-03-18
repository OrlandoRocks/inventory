class TrailerType < ApplicationRecord

  has_many :trilers
  has_many :trailer_category

  accepts_nested_attributes_for :trailer_category

  has_one_attached :image

end
