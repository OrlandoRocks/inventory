class SparePartSoldSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :unit_sale_price, :payment_type, :advance_payment
  has_one :client
  has_one :user
  has_one :spare_part
  has_one :fiscal_voucher
end
