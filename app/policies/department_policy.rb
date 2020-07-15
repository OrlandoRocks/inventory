class DepartmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.god? or @user.admin?
        if @user.current_company.equal?(0)
          scope.all.order('departments.name')
        else
          scope.joins(:company).where('companies.id = ?', @user.current_company).order('departments.name')
        end
      elsif @user.admin_company?
        scope.joins(:company).where('companies.user_id = ? And companies.id = ?', @user.id,@user.current_company).order('departments.name')
      elsif @user.admin_branch?
        scope.joins(:branch).where('branches.manager_id = ?', @user.id).order('departments.name')
      elsif @user.admin_department?
        scope.where(manager_id: @user.id).order('departments.name')
      else
        scope.none
      end
    end
  end
end
