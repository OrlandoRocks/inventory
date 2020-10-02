class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :role_id, :first_name, :last_name, :maiden_name, :username, :department_id, :employee_number,
             :current_company, :department, :branch
end
