class TrailerSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name,:photo, :image, :model, :trailer_type, :status, :trailer_length,
             :trailer_height, :ramp_type, :redila_type, :trailer_type, :floor_type, :capacity,
             :trailer_width, :brake_type, :color, :divition_type, :fender_type, :hydraulic_jack,
             :pull_type, :reinforcement_type, :roof_type, :suspension_type, :turn_type, :brand

  def image
    rails_blob_path(object.image, only_path: true) if object.image.attached?
  end

  def trailer_type
    object.trailer_type.as_json(except: :image) if object.trailer_type
  end


  def photo
    rails_blob_path(object.photo, only_path: true) if object.photo.attached?
  end

end
