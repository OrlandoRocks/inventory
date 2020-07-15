class StatusItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.god? or @user.admin?
        scope.all.order(:name)
      elsif @user.admin_company?
        scope.where.not(key: %w(baja)).order(:name)
      elsif @user.admin_branch?
        scope.where.not(key: %w(baja)).order(:name)
      else
        scope.none
      end
    end
  end
end
