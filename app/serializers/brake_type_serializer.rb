# == Schema Information
#
# Table name: brake_types
#
#  id         :bigint           not null, primary key
#  name       :string
#  model_part :string
#  status     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BrakeTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :model_part, :trailer_category, :status

  def trailer_category
    object.trailer_category.as_json(only: :id, include: {trailer_type:{only: [:id, :name]}}) if object.trailer_category
  end

end
