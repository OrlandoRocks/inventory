# == Schema Information
#
# Table name: items
#
#  id                         :integer          not null, primary key
#  name                       :string
#  description                :text
#  model                      :string
#  serial_number              :string
#  purchased_date             :date
#  in_service_date            :date
#  time_unit_service          :integer
#  time_quantity_service      :decimal(, )
#  price                      :decimal(, )
#  time_unit_depreciation     :integer
#  time_quantity_depreciation :decimal(, )
#  sub_category_id            :integer
#  provider_id                :integer
#  department_id              :integer
#  user_id                    :integer
#  brand_id                   :integer
#  status_item_id             :integer
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  code                       :string
#  image                      :string
#  maintenance_date           :date
#  maintenance_done           :boolean
#  branch_id                  :integer
#  category_id                :integer
#  to_assing                  :boolean
#  sale_price                 :decimal(, )
#  remission                  :string
#  accessory                  :string
#  acquisition_date           :date
#  trailer_id                 :bigint
#  payment_type               :integer
#  fiscal_voucher_id          :bigint
#  client_id                  :bigint
#  advance_payment            :decimal(, )
#  status_shipping_id         :bigint
#  color                      :string
#  trailer_length_id          :bigint
#  trailer_height_id          :bigint
#  ramp_type_id               :bigint
#  redila_type_id             :bigint
#  trailer_type_id            :bigint
#  floor_type_id              :bigint
#  capacity_id                :bigint
#  duck_tail                  :boolean
#  gooseneck                  :boolean
#  trailer_width_id           :bigint
#  color_id                   :bigint
#  hydraulic_jack_id          :bigint
#  pull_type_id               :bigint
#  brake_type_id              :bigint
#  reinforcement_type_id      :bigint
#  fender_type_id             :bigint
#  turn_type_id               :bigint
#  divition_type_id           :bigint
#  suspension_type_id         :bigint
#  roof_type_id               :bigint
#  categories_description     :text
#  seller_percentage          :decimal(, )
#  planet_percentage          :decimal(, )
#  branch_percentage          :decimal(, )
#

class ItemSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :code, :model, :serial_number, :purchased_date, :acquisition_date,
             :price, :price_total, :department_id, :user_id, :status_item_id, :branch_id, :branch, :department, :status_item,
             :accessory, :status_shipping, :remission, :payment_type, :fiscal_voucher, :client, :user,
             :trailer_length, :trailer_height, :ramp_type, :redila_type, :floor_type, :capacity,
             :trailer_width, :brake_type, :color, :divition_type, :fender_type, :hydraulic_jack, :advance_payment,
             :pull_type, :reinforcement_type, :roof_type, :suspension_type, :turn_type, :trailer_type, :brand, :categories_description,
             :seller_percentage, :planet_percentage, :branch_percentage, :image_base64, :image_path, 
  def user  
    object.user.as_json(except: [:avatar, :received_file], include: :department) if object.user
  end

  def trailer_type
    object.trailer_type.as_json(except: :image) if object.trailer_type
  end

  def image
    rails_blob_path(object.image, only_path: true) if object.image.attached?
  end
end
