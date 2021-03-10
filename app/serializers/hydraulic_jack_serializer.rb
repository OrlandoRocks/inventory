# == Schema Information
#
# Table name: hydraulic_jacks
#
#  id         :bigint           not null, primary key
#  name       :string
#  model_part :string
#  status     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class HydraulicJackSerializer < ActiveModel::Serializer
  attributes :id, :name, :model_part, :status
end
