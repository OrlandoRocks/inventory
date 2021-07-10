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

class DepartmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :branch_id, :branch, :manager_id, :manager, :code, :sequence, :last_code
end
