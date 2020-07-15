class CompanyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.god? or @user.admin?
        #if @user.current_company.equal?(0) or @user.current_company.equal?(nil)
          scope.all.order(:name)
        #else
        #  scope.where('companies.id = ?', @user.current_company)
        #end
      elsif @user.admin_company?
        scope.where(user_id: @user.id).order(:name)
      elsif @user.admin_branch?
        scope.joins(:branches).where('branches.manager_id= ?', @user.id).order(:name)
      else
        scope.none
      end
    end
  end
end
