class ItemSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :code, :model, :serial_number, :purchased_date, :acquisition_date,
             :price, :department_id, :user_id, :status_item_id, :branch_id, :branch, :department, :status_item,
             :accessory, :status_shipping, :remission, :payment_type, :fiscal_voucher, :client, :user,
             :user_departmemnt, :trailer_name

  def user_departmemnt
    object.user.department if object.user
  end

  def trailer_name
    object.trailer_type.name if object.trailer
  end

  def model
    object.trailer.model if object.trailer
  end


  def image
    rails_blob_path(object.image, only_path: true) if object.image.attached?
  end

end
