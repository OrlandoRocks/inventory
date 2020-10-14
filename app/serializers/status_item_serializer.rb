class StatusItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :key, :status
end
