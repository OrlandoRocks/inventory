require 'pathname'
json.array!(@sub_category) do |sub|
  json.extract! sub, :id, :name, :description, :status, :category_id
end
