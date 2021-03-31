# == Schema Information
#
# Table name: trailer_types
#
#  id         :bigint           not null, primary key
#  name       :string
#  image      :string
#  status     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  model_part :string
#

class TrailerTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :model_part, :status


  def image
    rails_blob_path(object.image, only_path: true) if object.image.attached?
  end
end
