json.extract! @item, :id, :name, :description,:code, :model, :branch_id, :accessory, :remission, :serial_number,
              :purchased_date, :acquisition_date, :in_service_date, :time_unit_service, :time_quantity_service,
              :price, :time_unit_depreciation, :sale_price, :time_quantity_depreciation, :provider_id, :department_id,
              :user_id, :brand, :status_item_id, :fiscal_voucher, :fiscal_voucher_id, :payment_type, :client_id,
              :client, :trailer_id, :user, :status_shipping_id, :advance_payment, :trailer_length, :trailer_height,
              :ramp_type, :redila_type, :floor_type, :capacity, :trailer_width, :brake_type, :color, :divition_type,
              :fender_type, :hydraulic_jack, :pull_type, :reinforcement_type, :roof_type, :suspension_type, :turn_type,
              :categories_description, :seller_percentage, :planet_percentage, :branch_percentage
json.trailer_type @item.trailer_type.as_json(except: :image) if @item.trailer_type
json.department_user @item.department.as_json(include: :branch)
json.branch @item.branch
json.image_url url_for(@item.image) if @item.image.attached?