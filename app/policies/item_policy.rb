#TODO: Cuando se creen los etatus quietar los artículos que esten en baja para los perfiles Director, Gerente y Coordinador

class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.god? or @user.admin?
        scope.all
      elsif @user.admin_branch?
        scope.where('items.status_item_id = 2')
      elsif @user.user_employee?
        scope.where(status_item_id: 2)
      else
        scope.not
      end
    end
  end
end
