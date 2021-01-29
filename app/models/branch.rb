class Branch < ApplicationRecord
  belongs_to :company, optional: true

  # belongs_to :state , :class_name => 'State' , foreign_key: 'state_id'
  belongs_to :city , :class_name => 'City' , foreign_key: 'city_id'

  has_one :state, through: :city

  has_one :department
  has_one :manager, through: :department
  has_many :items, through: :department

  delegate :name, to: :company, prefix: true, allow_nil: true

end
