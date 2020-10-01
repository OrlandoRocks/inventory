class SubCategory < ApplicationRecord
  belongs_to :category
  belongs_to :trailer
  has_many :items #, through: category
end
