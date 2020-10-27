
#Update de valores para los usuarios por sus nombre.
# User.where(email: 'admin_empresa@example.com').update_all email: 'director@example.com'
# User.where(email: 'admin_sucursal@example.com').update_all email: 'gerente@example.com'
# User.where(email: 'admin_departamento@example.com').update_all email: 'coordinador@example.com'

after :roles do
  puts '==> Creating the \'god user\'...'

# Deletes all existing records.
  User.delete_all

# Restarts ids to 1.
  ActiveRecord::Base.connection.reset_pk_sequence!('users')

  User.create(email: 'admin@agroplanet.com', username: 'admin', first_name: 'Admin', last_name: 'Agro',
              maiden_name: 'Planet', role_id: Role.find_by_key('admin').id, password: 'agroplanet',
              confirmed_at: Time.now, sign_in_count: 0, employee_number: 77777)

# Content.C
  User.create(email: 'god@example.com', username: 'divinity', first_name: 'God', last_name: 'System',
              maiden_name: 'User', role_id: Role.find_by_key('god').id, password: 'inventory',
              confirmed_at: Time.now, sign_in_count: 0, employee_number: 12345)

  User.create(email: 'alexrdgz03@gmail.com', username: 'alex', first_name: 'Alejandro', last_name: 'Rodriguez',
              maiden_name: 'UserAlex', role_id: Role.find_by_key('admin_sucursal').id, password: 'inventory',
              confirmed_at: Time.now, sign_in_count: 0, employee_number: 123)

  User.create(email: 'ovalencia@uach.mx', username: 'orlando', first_name: 'Orlando', last_name: 'Valencia',
              maiden_name: 'UserOrlando', role_id: Role.find_by_key('empleado_sin_acceso').id, password: 'inventory',
              confirmed_at: Time.now, sign_in_count: 0, employee_number: 567, current_company: 1)

  User.create(email: 'javitorres@uach.mx', username: 'javi', first_name: 'Javier', last_name: 'Torres',
              maiden_name: 'userJavi', role_id: Role.find_by_key('empleado_sin_acceso').id, password: 'inventory',
              confirmed_at: Time.now, sign_in_count: 0, employee_number: 1245, current_company: 1)

  # User.create(email: 'admin@example.com', username: 'admin', first_name: 'Admin', last_name: 'Admin',
  #             maiden_name: 'Admin', role_id: Role.find_by_key('admin').id, password: 'password',
  #             confirmed_at: Time.now, sign_in_count: 0)
  #
  # User.create(email: 'director@example.com', username: 'admin', first_name: 'Admin Empresa',
  #             last_name: 'Admin Empresa', maiden_name: 'Admin Empresa', role_id: Role.find_by_key('admin_empresa').id,
  #             password: 'password', confirmed_at: Time.now, sign_in_count: 0)
  #
  # User.create(email: 'gerente@example.com', username: 'admin_sucursal', first_name: 'Admin Sucursal',
  #             last_name: 'Admin Sucursal', maiden_name: 'Admin Sucursal', role_id: Role.find_by_key('admin_sucursal').id,
  #             password: 'password', confirmed_at: Time.now, sign_in_count: 0)
  #
  # User.create(email: 'coordinador@example.com', username: 'admin_departamento', first_name: 'Admin Departamento',
  #             last_name: 'Admin Departamento', maiden_name: 'Admin Departamento',
  #             role_id: Role.find_by_key('admin_departamento').id, password: 'password', confirmed_at: Time.now,
  #             sign_in_count: 0)


  Company.create(name: 'AgroTrailers Planet', description: 'AgroTrailers Planet',
                 address: 'Cambiar Direccion', phone: 'Cambiar Telefono',
                 user_id: 1)

end
