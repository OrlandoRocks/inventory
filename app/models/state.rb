# == Schema Information
#
# Table name: states
#
#  id         :integer          not null, primary key
#  name       :string
#  country_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class State < ApplicationRecord
  belongs_to :country
  has_many :cities
end
