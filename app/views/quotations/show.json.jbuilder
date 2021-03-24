json.extract! @quotation, :id, :model, :branch_id, :accessory, :price, :department_id, :user_id, :brand,
              :client_id, :client, :user,:trailer_length, :ramp_type, :redila_type, :floor_type, :capacity,
              :trailer_width, :brake_type, :color, :divition_type, :fender_type, :hydraulic_jack, :pull_type,
              :roof_type, :suspension_type, :turn_type, :categories_description, :trailer_type
json.trailer_type @quotation.trailer_type.as_json(except: :image) if @quotation.trailer_type
json.department_user @quotation.department.as_json(include: :branch)
json.branch @quotation.branch
