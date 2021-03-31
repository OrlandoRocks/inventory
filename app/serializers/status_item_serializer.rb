# == Schema Information
#
# Table name: status_items
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  status      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  key         :string
#

class StatusItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :key, :status
end
