class ItemSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id,:name, :code, :description, :image, :model, :serial_number, :purchased_date,
             :in_service_date, :time_unit_service, :time_quantity_service, :price, :category_id,
             :time_unit_depreciation, :time_quantity_depreciation, :sub_category_id, :provider_id,
             :department_id, :user_id, :brand_id, :status_item_id, :maintenance_date,
             :maintenance_done, :branch_id, :branch, :department, :status_item, :accessory,
             :remission, :trailer_id, :payment_type, :fiscal_voucher, :client


  def image
    rails_blob_path(object.image, only_path: true) if object.image.attached?
  end

end
