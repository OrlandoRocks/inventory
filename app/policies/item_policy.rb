
#TODO: Cuando se creen los etatus quietar los artículos que esten en baja para los perfiles Director, Gerente y Coordinador

class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.god? or @user.admin?
        if @user.current_company.equal?(0)
          scope.all
        end
      elsif @user.admin_branch?
        scope.where('items.status_item_id = 2')
      elsif @user.user_employee?
        scope.where(status_item_id: 2)
      else
        scope.not
      end
    end
    def orders
      if @user.god? or @user.admin?

      end
    end
  end
end
