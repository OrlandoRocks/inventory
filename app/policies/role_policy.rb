class RolePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.god?
        if @user.current_company.equal?(0)
          scope.all.where.not(key: %w(god))
        else
          scope.where(key: %w(admin_sucursal empleado_sin_acceso))
        end
        #scope.all #.where.not(key: %w(empleado empleado_sin_acceso))
      elsif  @user.admin?
        scope.all.where.not(key: %w(god))
      elsif @user.admin_company?
        scope.where(key: %w(admin_sucursal empleado_sin_acceso))
      elsif @user.admin_branch?
        scope.where(key: %w(empleado_sin_acceso))
      elsif @user.role_key.eql?('admin_remolques')
        scope.where(key: %w(admin_remolques vendedor_remolques us_remolques))
      else
        scope.none
      end
    end
  end
end
