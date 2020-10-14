class TrailerTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :status


  def image
    rails_blob_path(object.image, only_path: true) if object.image.attached?
  end
end
