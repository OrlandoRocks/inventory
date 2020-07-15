json.array!(@roles) do |role|
  json.extract! role, :id, :name, :key, :description, :scope
  json.url role_url(role, format: :json)
end
