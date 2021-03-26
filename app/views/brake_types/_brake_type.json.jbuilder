json.extract! brake_type, :id, :name, :model_part, :status, :created_at, :updated_at
json.trailer_category brake_type.trailer_category.as_json(only: :id, include: {trailer_type:{only: [:id, :name]}})
json.url brake_type_url(brake_type, format: :json)
