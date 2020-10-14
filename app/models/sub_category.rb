class SubCategory < ApplicationRecord
  belongs_to :category, optional: true
  has_many :trailers #, through: category
end
