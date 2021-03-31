#TODO: Cuando se creen los etatus quietar los artículos que esten en baja para los perfiles Director, Gerente y Coordinador

class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.god? or @user.admin?
        scope.unsold.includes(:branch).includes(:department)
      elsif @user.admin_branch?
        scope.unsold.includes(:branch).includes(:department)
      elsif @user.user_employee?
        scope.unsold.includes(:branch).includes(:department)
      else
        scope.none
      end
    end
  end
end
