class DepartmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :branch_id, :branch, :manager_id, :manager, :code, :sequence, :last_code
end
