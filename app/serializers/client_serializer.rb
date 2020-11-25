class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :last_name, :maiden_name, :address, :postal_code, :email, :phone_number, :cellphone, :contact, :full_name, :rfc, :suburb, :state, :city, :company
  
  def full_name
    "#{object.name} #{object.last_name} #{object.maiden_name}"
  end

end
