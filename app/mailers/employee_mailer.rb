class EmployeeMailer < ApplicationMailer

  default from: "activos.corporativos@gmail.com"

  def department_employee_destroy(manager, employee,items = [])
    @employee = employee
    @manager = manager
    @items = items
    mail(to: @manager.email, subject: 'Un empleado fue eliminado')
  end

end
