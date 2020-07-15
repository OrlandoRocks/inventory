class RolePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.god?
        if @user.current_company.equal?(0)
          scope.all.where.not(key: %w(god))
        else
          scope.where(key: %w( admin_empresa admin_sucursal admin_departamento empleado_sin_acceso))
        end
        #scope.all #.where.not(key: %w(empleado empleado_sin_acceso))
      elsif  @user.admin?
        scope.all.where.not(key: %w(god))
      elsif @user.admin_company?
        scope.where(key: %w( admin_sucursal admin_departamento empleado_sin_acceso))
      elsif @user.admin_branch?
        scope.where(key: %w( admin_departamento empleado_sin_acceso))
      elsif @user.admin_department?
        scope.where(key: %w(empleado_sin_acceso))
      else
        scope.none
      end
    end
  end
end
