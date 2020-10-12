json.extract! client, :id, :name,:full_name, :last_name, :maiden_name, :address, :postal_code, :email, :phone_number, :cellphone, :contact, :created_at, :updated_at
json.url client_url(client, format: :json)
