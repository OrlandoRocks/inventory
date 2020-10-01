
json.extract! @user, :id, :first_name
json.branch @user.department.branch
json.department @user.department

