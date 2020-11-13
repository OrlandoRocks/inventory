class ItemSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :code, :model, :serial_number, :purchased_date, :acquisition_date,
             :price, :department_id, :user_id, :status_item_id, :branch_id, :branch, :department, :status_item,
             :accessory, :status_shipping, :remission, :payment_type, :fiscal_voucher, :client, :user,
             :user_departmemnt, :trailer_length, :trailer_height, :ramp_type, :redila_type, :floor_type, :capacity,
             :trailer_width, :brake_type, :color, :divition_type, :fender_type, :hydraulic_jack,
             :pull_type, :reinforcement_type, :roof_type, :suspension_type, :turn_type, :trailer_type, :brand

  def user_departmemnt
    object.user.department if object.user
  end

  def trailer_type
    object.trailer_type.as_json(except: :image) if object.trailer_type
  end

  def model
    object.trailer.model if object.trailer
  end


  def image
    rails_blob_path(object.image, only_path: true) if object.image.attached?
  end

end
