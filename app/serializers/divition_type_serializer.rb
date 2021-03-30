# == Schema Information
#
# Table name: divition_types
#
#  id         :bigint           not null, primary key
#  name       :string
#  model_part :string
#  status     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DivitionTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :model_part, :status
end
