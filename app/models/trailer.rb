class Trailer < ApplicationRecord
  has_one :category, through: :sub_category
  has_one :sub_category, through: :sub_category

  has_one_attached :image
end
