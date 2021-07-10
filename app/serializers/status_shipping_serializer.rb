# == Schema Information
#
# Table name: status_shippings
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  status      :boolean
#  key         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class StatusShippingSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :status, :key
end
