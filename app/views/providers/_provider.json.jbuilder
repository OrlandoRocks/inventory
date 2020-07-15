json.extract! provider, :id, :name, :description, :contact, :phone, :email, :created_at, :updated_at
json.url provider_url(provider, format: :json)