# == Schema Information
#
# Table name: trailers
#
#  id                    :bigint           not null, primary key
#  name                  :string
#  model                 :string
#  photo                 :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  category_id           :bigint
#  sub_category_id       :bigint
#  image                 :string
#  status                :boolean
#  trailer_type_id       :bigint
#  trailer_length_id     :bigint
#  trailer_height_id     :bigint
#  trailer_width_id      :bigint
#  ramp_type_id          :bigint
#  redila_type_id        :bigint
#  floor_type_id         :bigint
#  capacity_id           :bigint
#  color_id              :bigint
#  hydraulic_jack_id     :bigint
#  pull_type_id          :bigint
#  brake_type_id         :bigint
#  reinforcement_type_id :bigint
#  fender_type_id        :bigint
#  turn_type_id          :bigint
#  divition_type_id      :bigint
#  suspension_type_id    :bigint
#  roof_type_id          :bigint
#  brand_id              :bigint
#

class TrailerSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name,:photo_base64, :photo_path, :image_path, :model,
              :trailer_type_id, :trailer_length_id, :trailer_height_id, :trailer_width_id, :ramp_type_id, 
              :redila_type_id, :floor_type_id, :capacity_id, :color_id, :hydraulic_jack_id, :pull_type_id, 
              :brake_type_id, :reinforcement_type_id, :fender_type_id, :turn_type_id, :divition_type_id, 
              :suspension_type_id, :roof_type_id, :brand_id

  def trailer_type
    object.trailer_type.as_json(except: :image) if object.trailer_type
  end

  def image_base64
    Base64.encode64(File.read(ActiveStorage::Blob.service.path_for(object.image.key))) if object.image.attached?
  end
  def image_path     
    rails_blob_path(object.image, only_path: true) if object.image.attached?
  end
  def photo_base64
    Base64.encode64(File.read(ActiveStorage::Blob.service.path_for(object.photo.key))) if object.photo.attached?
  end
  def photo_path
    rails_blob_path(object.photo, only_path: true) if object.photo.attached?
  end

end
