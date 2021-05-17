#TODO: Cuando se creen los etatus quietar los artículos que esten en baja para los perfiles Director, Gerente y Coordinador

class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.current_company.eql?('planet')
        if @user.god? or @user.admin?
          scope.planet.unsold.includes(:branch).includes(:department)
        elsif @user.admin_branch?
          scope.planet.unsold.includes(:branch).includes(:department)
        elsif @user.user_employee?
          scope.planet.unsold.includes(:branch).includes(:department)
        else
          scope.none
        end
      elsif @user.current_company.eql?('remolques')
        scope.remolques
      else
        scope.none
      end
    end
  end
end
