json.extract! trailer_type, :id, :name, :us_name, :status, :created_at, :updated_at, :model_part
json.trailer_categories trailer_type.trailer_category
json.image url_for(trailer_type.image) if trailer_type.image.attached?
json.url trailer_type_url(trailer_type, format: :json)
