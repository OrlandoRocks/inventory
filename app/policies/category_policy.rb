class CategoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.god? or @user.admin?
        if @user.current_company.equal?(0)
          scope.all.order(:name)
        else
          p "----------------------------------------------------------------------------------------------------------------------------"
          p @user.current_company
         scope.where(company_id: @user.current_company).order(:name)
        end
      elsif @user.admin_company?
        scope.joins(:company).where('companies.user_id = ? And companies.id = ?', @user.id,@user.current_company).order('categories.name')
      elsif @user.admin_branch?
        scope.joins(company: :branches).where('branches.manager_id = ? ', @user.id).order('categories.name')
      elsif @user.admin_department?
        scope.joins(company: {branches: :departments}).where('departments.manager_id = ? ', @user.id).order('categories.name')
      else
        scope.none
      end
    end
  end
end
