# == Schema Information
#
# Table name: brands
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  model_part  :string
#  status      :boolean
#

class Brand < ApplicationRecord

  has_many :trailer_category
  accepts_nested_attributes_for :trailer_category

end
