
#TODO: Cuando se creen los etatus quietar los artículos que esten en baja para los perfiles Director, Gerente y Coordinador

class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.god? or @user.admin?
        if @user.current_company.equal?(0)
          scope.all
        else
          ids = scope.joins(:company).where('companies.id = ?', @user.current_company).pluck(:id) +
              scope.joins(:direct_company)
                  .where('companies.id = ?', @user.current_company).pluck(:id)

          scope.where(id: ids)
        end
      elsif @user.admin_company?
        ids = scope.joins(:company).where('companies.user_id = ?', @user.id).pluck(:id) +
            scope.joins(:direct_company)
                .where('companies.user_id = ? and items.department_id is NULL', @user.id).pluck(:id)

        scope.where(id: ids)

      elsif @user.admin_branch?

        ids = scope.joins(:direct_branch).where('branches.manager_id = ? AND items.status_item_id = 2', @user.id).pluck(:id)

        status_id = StatusItem.where(key: %w(baja)).first
        scope.where(id: ids).where.not(status_item_id: status_id)

      elsif @user.admin_department?
        status_id = StatusItem.where(key: %w(baja)).first
        scope.joins(:department).where('departments.manager_id = ? And items.status_id != ? ', @user.id,status_item_id)
      else
        scope.where(user_id: @user.id)
      end
    end
  end
end
