require 'pathname'
  json.extract! @department, :id,:name, :description, :branch_id, :manager_id, :code, :sequence, :last_code
  json.manager @department.try(:manager)
  json.branch @department.try(:branch)