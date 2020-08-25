class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :items #, through: category
end
