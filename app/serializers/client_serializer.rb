# == Schema Information
#
# Table name: clients
#
#  id           :bigint           not null, primary key
#  name         :string
#  last_name    :string
#  maiden_name  :string
#  address      :string
#  postal_code  :string
#  email        :string
#  phone_number :string
#  cellphone    :string
#  contact      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  rfc          :string
#  suburb       :string
#  state_id     :bigint
#  city_id      :bigint
#  company      :string
#

class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :last_name, :maiden_name, :address, :postal_code, :email, :phone_number, :cellphone, :contact, :full_name, :rfc, :suburb, :state, :city, :company
  
  def full_name
    "#{object.name} #{object.last_name} #{object.maiden_name}"
  end

end
