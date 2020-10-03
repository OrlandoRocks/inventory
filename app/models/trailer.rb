class Trailer < ApplicationRecord
  belongs_to :sub_category
  has_one :category, through: :sub_category

  has_many :items
  has_one_attached :image
  has_one_attached :photo
end
