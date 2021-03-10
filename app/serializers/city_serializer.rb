# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  name       :string
#  state_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CitySerializer < ActiveModel::Serializer
  attributes :id, :name, :state, :state_id
end
