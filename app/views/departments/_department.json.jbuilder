json.extract! department, :id, :name, :description, :branch_id, :manager_id, :created_at, :updated_at
json.url department_url(department, format: :json)