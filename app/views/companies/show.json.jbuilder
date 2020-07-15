json.extract! @company, :id, :name, :description, :logo, :manager, :address, :phone, :email, :user_id, :created_at, :updated_at
admin = User.find_by_role_id(Role.find_by_key('admin'))
json.boss "#{admin.try(:first_name)} #{admin.try(:last_name)}"
json.manager @company.user.nil? ? "" :"#{@company.user.first_name} #{@company.user.last_name}"
json.branches @company.branches.order('branches.name').each do |branch|
  json.id branch.id
  json.name branch.name
  json.description branch.description
end