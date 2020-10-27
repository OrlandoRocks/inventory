class FloorTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :model_part, :status
end
