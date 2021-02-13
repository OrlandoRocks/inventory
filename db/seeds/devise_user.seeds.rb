
#Update de valores para los usuarios por sus nombre.
# User.where(email: 'admin_empresa@example.com').update_all email: 'director@example.com'
# User.where(email: 'admin_sucursal@example.com').update_all email: 'gerente@example.com'
# User.where(email: 'admin_departamento@example.com').update_all email: 'coordinador@example.com'

after :departments do
  after :roles do
    puts '==> Creating the \'god user\'...'

# Deletes all existing records.
    User.delete_all

# Restarts ids to 1.
    ActiveRecord::Base.connection.reset_pk_sequence!('users')
    ActiveRecord::Base.connection.reset_pk_sequence!('companies')

    User.create(email: 'god@example.com', username: 'divinity', first_name: 'God', last_name: 'System',
                maiden_name: 'User', role_id: Role.find_by_key('god').id, password: 'inventory',
                confirmed_at: Time.now, sign_in_count: 0, employee_number: 12345, department_id: Department.where(name: 'Oficina Central').first.id)

    User.create(email: 'peter.loewen@agroplanet.com', username: 'Admin Peter', first_name: 'Pedro', last_name: 'Loewen',
                maiden_name: '', role_id: Role.find_by_key('god').id, password: 'agroplanet',
                confirmed_at: Time.now, sign_in_count: 0, employee_number: 1000, department_id: Department.where(name: 'Oficina Central').first.id)
    Branch.where(name: 'Cuauhtemoc').first.update(manager_id: User.last.id)
    Department.where(name: 'Oficina Central').first.update(manager_id: User.last.id)


    User.create(email: 'cesar.guerrero@agroplanet.com', username: 'Vendedor Cesar', first_name: 'Cesar', last_name: 'Guerrero',
                maiden_name: '', role_id: Role.find_by_key('empleado_sin_acceso').id, password: 'agroplanet',
                confirmed_at: Time.now, sign_in_count: 0, employee_number: 1101, department_id: Department.where(name: 'Oficina Central').first.id)


    User.create(email: 'isaac.gutierrez@agroplanet.com', username: 'Vendedor Isaac', first_name: 'Isaac', last_name: 'Gutierrez',
                maiden_name: '', role_id: Role.find_by_key('empleado_sin_acceso').id, password: 'agroplanet',
                confirmed_at: Time.now, sign_in_count: 0, employee_number: 1102, department_id: Department.where(name: 'Oficina Central').first.id)


    User.create(email: 'francisco.orozco@agroplanet.com', username: 'Vendedor Francisco', first_name: 'Francisco', last_name: 'Orozco',
                maiden_name: '', role_id: Role.find_by_key('empleado_sin_acceso').id, password: 'agroplanet',
                confirmed_at: Time.now, sign_in_count: 0, employee_number: 1103, department_id: Department.where(name: 'Oficina Central').first.id)



    User.create(email: 'hugo.reyes@agroplanet.com', username: 'Gerente Arteaga', first_name: 'Hugo', last_name: 'Reyes',
                maiden_name: '', role_id: Role.find_by_key('admin_sucursal').id, password: 'agroplanet',
                confirmed_at: Time.now, sign_in_count: 0, employee_number: 2000, department_id: Department.where(name: 'Arteaga').first.id)
    Branch.where(name: 'Arteaga').first.update(manager_id: User.last.id)
    Department.where(name: 'Arteaga').first.update(manager_id: User.last.id)


    User.create(email: 'oscar.guevara@agroplanet.com', username: 'Gerente Arteaga', first_name: 'Óscar', last_name: 'Guevara',
                maiden_name: 'Rangel', role_id: Role.find_by_key('admin_sucursal').id, password: 'agroplanet',
                confirmed_at: Time.now, sign_in_count: 0, employee_number: 3000, department_id: Department.where(name: 'Irapuato').first.id)
    Branch.where(name: 'Irapuato').first.update(manager_id: User.last.id)
    Department.where(name: 'Irapuato').first.update(manager_id: User.last.id)



    User.create(email: 'daniel.ramirez@agroplanet.com', username: 'Vendedor Daniel', first_name: 'Daniel', last_name: 'Ramirez',
                maiden_name: 'Ruiz', role_id: Role.find_by_key('empleado_sin_acceso').id, password: 'agroplanet',
                confirmed_at: Time.now, sign_in_count: 0, employee_number: 3101, department_id: Department.where(name: 'Irapuato').first.id)

    User.create(email: 'lucero.cortez@agroplanet.com', username: 'Vendedor Daniel', first_name: 'Lucero', last_name: 'Cortez',
                maiden_name: 'Hernandez', role_id: Role.find_by_key('empleado_sin_acceso').id, password: 'agroplanet',
                confirmed_at: Time.now, sign_in_count: 0, employee_number: 3102, department_id: Department.where(name: 'Irapuato').first.id)





    User.create(email: 'raymundo.leon@agroplanet.com', username: 'Gerente Irapuato', first_name: 'Raymundo', last_name: 'Leon',
                maiden_name: 'Valenzuela', role_id: Role.find_by_key('admin_sucursal').id, password: 'agroplanet',
                confirmed_at: Time.now, sign_in_count: 0, employee_number: 4000, department_id: Department.where(name: 'Cueramaro').first.id)

    Branch.where(name: 'Cueramaro').first.update(manager_id: User.last.id)
    Department.where(name: 'Cueramaro').first.update(manager_id: User.last.id)


    User.create(email: 'maria.elena.guevara@agroplanet.com', username: 'Vendedor Maria Elena', first_name: 'Maria Elena', last_name: 'Guevara',
                maiden_name: 'Rivera', role_id: Role.find_by_key('empleado_sin_acceso').id, password: 'agroplanet',
                confirmed_at: Time.now, sign_in_count: 0, employee_number: 4101, department_id: Department.where(name: 'Cueramaro').first.id)


    User.create(email: 'eduardo.ramos@agroplanet.com', username: 'Vendedor Marcos Eduardos', first_name: 'Marcos Eduardo', last_name: 'Ramos',
                maiden_name: 'Gonzalez', role_id: Role.find_by_key('empleado_sin_acceso').id, password: 'agroplanet',
                confirmed_at: Time.now, sign_in_count: 0, employee_number: 4102, department_id: Department.where(name: 'Cueramaro').first.id)




    User.create(email: 'eduardo.turner@agroplanet.com', username: 'Gerente Manclova', first_name: 'Eduardo', last_name: 'Turner',
                maiden_name: 'López', role_id: Role.find_by_key('admin_sucursal').id, password: 'agroplanet',
                confirmed_at: Time.now, sign_in_count: 0, employee_number: 5000, department_id: Department.where(name: 'Monclova').first.id)
    Branch.where(name: 'Monclova').first.update(manager_id: User.last.id)
    Department.where(name: 'Monclova').first.update(manager_id: User.last.id)



# Branch.where(name: 'Alchichica').first.update(manager_id: User.last.id)
    # Department.where(name: 'Alchichica').first.update(manager_id: User.last.id)
    #
    #
    #
    #
    # Department.where(name: 'Tultitlan').first.update(manager_id: User.last.id)
    # Department.where(name: 'Hasta Bandera').first.update(manager_id: User.last.id)
    #


    Company.create(name: 'AgroTrailers Planet', description: 'AgroTrailers Planet',
                   address: 'Cambiar Direccion', phone: 'Cambiar Telefono',
                   user_id: User.first.id)

    Branch.all.each{|b| b.update(company_id:Company.first.id)}
    User.all.each{|b| b.update(current_company:Company.first.id)}

  end
end
