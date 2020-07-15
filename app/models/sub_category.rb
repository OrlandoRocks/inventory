class SubCategory < ActiveRecord::Base
  belongs_to :category
  has_many :items #, through: category
end
