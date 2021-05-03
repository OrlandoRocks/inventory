class DepartmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.god? or @user.admin?
          scope.all.order('departments.name')
      elsif @user.admin_company?
        scope.joins(:company).where('companies.user_id = ?', @user.id).order('departments.name')
      elsif @user.admin_branch?
        scope.joins(:branch).where('branches.manager_id = ?', @user.id).order('departments.name')
      else
        scope.none
      end
    end
  end
end
