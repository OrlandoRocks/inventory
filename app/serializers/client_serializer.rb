class ClientSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :name, :last_name, :maiden_name, :address, :postal_code, :email, :phone_number, :cellphone, :contact
end
