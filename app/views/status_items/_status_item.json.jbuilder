json.extract! status_item, :id, :name, :description, :status, :created_at, :updated_at
json.url status_item_url(status_item, format: :json)