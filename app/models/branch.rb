class Branch < ApplicationRecord
  belongs_to :company, optional: true

  # belongs_to :state , :class_name => 'State' , foreign_key: 'state_id'
  belongs_to :city , :class_name => 'City' , foreign_key: 'city_id'

  has_one :state, through: :city

  has_many :departments
  has_many :managers, through: :departments
  has_many :items, through: :departments

  # delegate :name, to: :company, prefix: true, allow_nil: true

end
