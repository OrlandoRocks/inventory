json.extract! company, :id, :name, :description, :logo, :manager, :address, :phone, :email, :user_id, :created_at, :updated_at



json.url company_url(company, format: :json)