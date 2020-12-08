class StatusShippingSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :status, :key
end
