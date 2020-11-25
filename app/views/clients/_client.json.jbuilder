json.extract! client, :id, :name, :last_name, :maiden_name, :address, :postal_code, :email, :phone_number, :cellphone, :contact,
              :rfc, :suburb, :state_id, :city_id, :company, :created_at, :updated_at
json.full_name "#{client.name} #{client.last_name} #{client.maiden_name}"
json.url client_url(client, format: :json)
