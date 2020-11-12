json.array!(@items) do |item|
  json.extract! item, :id, :name, :description, :model, :branch_id, :accessory, :remission, :trailer, :serial_number,
                :purchased_date, :acquisition_date, :in_service_date, :time_unit_service, :time_quantity_service,
                :price, :time_unit_depreciation, :time_quantity_depreciation, :sub_category_id, :provider_id,
                :department_id, :user_id, :brand_id, :status_item_id, :status_shipping_id, :advance_payment,
                :trailer_length, :trailer_height, :ramp_type, :redila_type, :floor_type, :capacity,
                :trailer_width, :brake_type, :color, :divition_type, :fender_type, :hydraulic_jack,
                :pull_type, :reinforcement_type, :roof_type, :suspension_type, :turn_type
  json.trailer_type item.trailer_type.as_json(except: :image) if item.trailer_type
  json.image_url url_for(item.image) if item.image.attached?
  json.url item_url(item, format: :json)
end
