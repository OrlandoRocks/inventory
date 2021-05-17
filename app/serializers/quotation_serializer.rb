# == Schema Information
#
# Table name: quotations
#
#  id                     :bigint           not null, primary key
#  user_id                :bigint
#  price                  :decimal(, )
#  model                  :string
#  client_id              :bigint
#  branch_id              :bigint
#  department_id          :bigint
#  trailer_type_id        :bigint
#  brake_type_id          :bigint
#  trailer_width_id       :bigint
#  color_id               :bigint
#  trailer_length_id      :bigint
#  divition_type_id       :bigint
#  floor_type_id          :bigint
#  fender_type_id         :bigint
#  ramp_type_id           :bigint
#  hydraulic_jack_id      :bigint
#  capacity_id            :bigint
#  pull_type_id           :bigint
#  redila_type_id         :bigint
#  brand_id               :bigint
#  roof_type_id           :bigint
#  suspension_type_id     :bigint
#  turn_type_id           :bigint
#  accessory              :string
#  categories_description :string
#  catalog                :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class QuotationSerializer < ActiveModel::Serializer
  attributes :id
end
