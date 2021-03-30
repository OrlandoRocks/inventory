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
