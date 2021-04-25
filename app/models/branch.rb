# == Schema Information
#
# Table name: branches
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  city_id     :integer
#  company_id  :integer
#  manager_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  state_id    :integer
#  code        :string
#  last_code   :integer
#  fleet_cost  :decimal(, )      default(0.0)
#

class Branch < ApplicationRecord
  belongs_to :company, optional: true

  # belongs_to :state , :class_name => 'State' , foreign_key: 'state_id'
  belongs_to :city , :class_name => 'City' , foreign_key: 'city_id'

  belongs_to :manager, class_name: 'User', foreign_key: 'manager_id', optional: true

  has_one :state, through: :city


  has_many :departments

  has_many :items, through: :departments



  # delegate :name, to: :company, prefix: true, allow_nil: true
end
