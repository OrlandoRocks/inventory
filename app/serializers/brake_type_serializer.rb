class BrakeTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :model_part, :trailer_category, :status

  def trailer_category
    object.trailer_category.as_json(only: :id, include: {trailer_type:{only: [:id, :name]}}) if object.trailer_category
  end

end
