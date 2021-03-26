class Color < ApplicationRecord
  has_many :trailer_category

  accepts_nested_attributes_for :trailer_category
end
