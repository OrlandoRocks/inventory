class SubCategoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.god? or @user.admin?
        if @user.current_company.equal?(0)
          scope.all
        else
          #scope.joins(:category).where('category.company_id =?',@user.current_company)
          scope.joins(:category).where('categories.company_id =?',@user.current_company)
        end
      elsif @user.admin_company?
        scope.joins(category: :company).where('companies.user_id = ?', @user.id)
      else
        scope.none
      end
    end
  end
end
