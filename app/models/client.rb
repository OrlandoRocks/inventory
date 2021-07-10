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

class Client < ApplicationRecord

  belongs_to :city , :class_name => 'City' , foreign_key: 'city_id'

  has_one :state, through: :city

  has_many :item

  has_associated_audits

  audited


  def full_name
    "#{self.name} #{self.last_name} #{self.maiden_name}"
  end
end
