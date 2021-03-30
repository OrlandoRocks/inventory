class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.god?
        scope.all
      elsif @user.admin?
        # if @user.current_company.equal?(0)
          scope.where(current_company: 'planet').order('users.employee_number asc')
        # else
        #   ids = [@user.id]
        #   #Usuarios que son los directores de COMPAÑIA - company
        #   ids += scope.joins(:companies).where('companies.id = ?', @user.current_company).pluck(:user_id)
        #   #Usuarios que son Gerentes de SUCURSAL - BRANCH
        #   ids += scope.joins(companies: :branches).where('companies.id = ?', @user.current_company).pluck(:manager_id)
        #   #Usuarios que pertenecen a un DEPARTAMENTO - departament
        #   ids += scope.joins(companies: {branches: :departments}).where('companies.id = ?', @user.current_company).pluck('departments.manager_id')
        #
        #   id_department = Company.joins(branches: :departments).where('companies.id = ?',@user.current_company).pluck('departments.id')
        #
        #   ids.uniq!
        #   id_department.uniq!
        #   #scope.where(id: ids).order(:role_id)
        #
        #    scope.where('users.id in (?) or department_id in (?) ',ids.compact,id_department.compact).order('users.employee_number asc')
        #
        # end
      elsif @user.admin_company?
        ids = [@user.id]
        @user.companies.each {|c| ids += c.branches.pluck(:manager_id) }
        @user.companies.each {|c| c.branches.each {|b| ids += b.departments.pluck(:manager_id)} }
        ids += scope.joins(:company).where(companies: { user_id: @user.id }).pluck(:id)

        ids.uniq!
        scope.where(id: ids, current_company: 'planet').order('users.employee_number asc')
      elsif @user.admin_branch?
        scope.where(current_company: 'planet').order('users.employee_number asc')

        # ids = [@user.id]
        # @user.branches.each {|b| ids += b.departments.pluck(:manager_id)}
        # ids += scope.joins(:branch).where(branches: { manager_id: @user.id }).pluck(:id)
        #
        # ids.uniq!
        # scope.where(id: ids).order('users.employee_number asc')
      elsif @user.admin_department?
        ids = [@user.id]
        ids += scope.joins(:department).where(departments: {manager_id: @user.id}).pluck(:id)

        ids.uniq!
        scope.where(id: ids, current_company: 'planet').order('users.employee_number asc')
      elsif @user.role_key.eql?('admin_remolques')
        scope.where(current_company: 'remolques')
      else
        scope.none
      end
    end
  end
end
