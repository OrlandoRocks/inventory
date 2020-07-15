class Branch < ActiveRecord::Base
  belongs_to :company
  belongs_to :user , :class_name => 'User' , foreign_key: 'manager_id'
  belongs_to :state , :class_name => 'State' , foreign_key: 'state_id'
  belongs_to :city , :class_name => 'City' , foreign_key: 'city_id'

  has_one :state, through: :city

  has_many :departments

  delegate :name, to: :company, prefix: true, allow_nil: true

end
