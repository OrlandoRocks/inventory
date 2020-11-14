json.array!(@clients) do |client|
  json.extract! client, :id, :name, :last_name, :maiden_name, :address, :postal_code, :email, :phone_number, :cellphone,
                :contact, :full_name, :created_at, :updated_at

end
