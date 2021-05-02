class SparePartSerializer < ActiveModel::Serializer
  attributes :id, :instock, :unit_cost, :measurement
  has_one :sub_category
end
