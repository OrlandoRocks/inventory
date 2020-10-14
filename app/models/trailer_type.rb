class TrailerType < ApplicationRecord

  has_many :trilers

  has_one_attached :image

end
