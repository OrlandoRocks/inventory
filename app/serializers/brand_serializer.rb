# == Schema Information
#
# Table name: brands
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  model_part  :string
#  status      :boolean
#

class BrandSerializer < ActiveModel::Serializer
  attributes :id, :name, :model_part, :status
end
