json.extract! @item, :id, :name, :sub_category, :description,:code, :model, :branch_id, :accessory, :remission,
              :serial_number, :purchased_date, :acquisition_date, :in_service_date, :time_unit_service, :time_quantity_service,
              :price, :time_unit_depreciation, :sale_price, :time_quantity_depreciation, :sub_category_id, :provider_id,
              :department_id, :user_id, :brand_id, :status_item_id, :fiscal_voucher, :fiscal_voucher_id, :payment_type,
              :client_id, :client, :trailer_id, :user
json.department_user @item.department
json.image_url url_for(@item.image) if @item.image.attached?