class ItemSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id,:name, :code, :description, :image, :model, :serial_number, :purchased_date, :acquisition_date,
             :in_service_date, :time_unit_service, :time_quantity_service, :price, :category, :category_id,
             :time_unit_depreciation, :time_quantity_depreciation, :sub_category, :sub_category_id, :provider_id,
             :department_id, :user_id, :brand_id, :status_item_id, :maintenance_date,
             :maintenance_done, :branch_id, :branch, :department, :status_item, :accessory, :status_shipping,
             :remission, :trailer_id, :payment_type, :fiscal_voucher, :client, :user, :user_departmemnt, :trailer_name

  def user_departmemnt
    object.user.department if object.user
  end

  def trailer_name
    object.trailer.name if object.trailer
  end

  def image
    rails_blob_path(object.image, only_path: true) if object.image.attached?
  end

end
