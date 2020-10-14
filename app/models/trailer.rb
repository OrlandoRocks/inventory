class Trailer < ApplicationRecord
  belongs_to :sub_category
  belongs_to :category
  belongs_to :trailer_type

  # has_one_attached :image
  # has_one_attached :photo
  has_many :items
end
