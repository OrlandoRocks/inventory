# == Schema Information
#
# Table name: departments
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  branch_id   :integer
#  manager_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  code        :string
#  sequence    :integer
#  last_code   :string
#

class Department < ApplicationRecord
  belongs_to :branch
  has_one :company, through: :branch
  has_one :city, through: :branch
  has_one :state, through: :city
  belongs_to :manager, class_name: 'User', foreign_key: 'manager_id', optional: true

  has_many :items
  has_many :employees,
           -> { where(role_id: Role.where(key: %w(empleado empleado_sin_acceso)).pluck(:id)) },
           class_name: 'User',
           foreign_key: 'department_id'

  delegate :name, to: :branch, prefix: true, allow_nil: true
  delegate :full_name, to: :manager, prefix: true, allow_nil: true

end
