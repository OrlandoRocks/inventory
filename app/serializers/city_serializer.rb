class CitySerializer < ActiveModel::Serializer
  attributes :id, :name, :state, :state_id
end
