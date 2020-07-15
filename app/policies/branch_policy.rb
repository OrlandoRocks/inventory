class BranchPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.god? or @user.admin?
        if @user.current_company.equal?(0)
          scope.joins(:company).order('companies.name ,branches.name')
        else
          scope.joins(:company).where('companies.id = ?', @user.current_company).order('companies.name ,branches.name')
        end
      elsif @user.admin_company?
        scope.joins(:company).where('companies.user_id = ? And companies.id = ?', @user.id,@user.current_company).order('companies.name,branches.name')
      elsif @user.admin_branch?
        scope.where(manager_id: @user.id).order('branches.name')
      else
        scope.none
      end
    end
  end
end
