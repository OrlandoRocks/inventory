class TrailerSerializer < ActiveModel::Serializer
  attributes :id, :name, :model, :photo, :image, :category_id, :category, :sub_category_id, :sub_category

  def image
    rails_blob_path(object.image, only_path: true) if object.image.attached?
  end
end
