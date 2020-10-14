class TrailerSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name,:photo, :image, :model, :category_id, :category, :sub_category_id, :sub_category, :trailer_type, :trailer_type_id, :status

  def image
    rails_blob_path(object.image, only_path: true) if object.image.attached?
  end

  def photo
    rails_blob_path(object.photo, only_path: true) if object.photo.attached?
  end

end
