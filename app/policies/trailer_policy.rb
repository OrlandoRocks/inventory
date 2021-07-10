class TrailerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.current_company.eql?('planet')
        if @user.god? or @user.admin?
            scope.all.order(:name)
        elsif @user.admin_company?
          scope.all.order(:name)
        elsif @user.admin_branch?
          scope.all.order(:name)
        elsif @user.admin_department?
          scope.all.order(:name)
        else
          scope.none
        end
      else
        scope.all.order(:name)
      end
    end
  end
end
