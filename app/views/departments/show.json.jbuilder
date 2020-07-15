json.partial! "departments/department", department: @department
json.manager @department.manager.nil? ? '' : "#{@department.manager.first_name} #{@department.manager.last_name}"
json.boss @department.branch.user.nil? ? '' : "#{@department.branch.user.first_name} #{@department.branch.user.last_name}"