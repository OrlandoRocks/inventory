role_admin_remolques = Role.find_by(key: 'admin_remolques')
if role_admin_remolques.nil?
  role_admin_remolques = Role.create(name: 'Administrador de Remolques del Norte', key: 'admin_remolques', description: 'Administrador de Remolques del Norte.', scope: 0)
end

role_venedor_remolques = Role.find_by(key: 'vendedor_remolques')
if role_venedor_remolques.nil?
  role_venedor_remolques = Role.create(name: 'Vendedor de Remolques del Norte', key: 'vendedor_remolques', description: 'Vendedor de Remolques del Norte.', scope: 0)
end
User.all.each {|u| u.update_column('current_company', 0)} if User.pluck(:current_company).all?(nil)

permissions = [
    { name: "Ver la lista de remolques para Remolques del Norte",
      description: "Permite ver la lista de remolques para Remolques del Norte",
      action: "remolques_index", controller: "Items"},
    { name: "Ver vista para crear remolque para Remolques del Norte",
      description: "Permite ver vista para crear remolque para Remolques del Norte",
      action: "remolques_new", controller: "Items"},
    { name: "Ver vista para editar remolque para Remolques del Norte",
      description: "Permite ver vista para editar remolque para Remolques del Norte",
      action: "remolques_edit", controller: "Items"},
    { name: "Crear remolque para Remolques del Norte",
      description: "Permite crear remolque para Remolques del Norte",
      action: "remolques_create", controller: "Items"},
    { name: "Actualizar remolque para Remolques del Norte",
      description: "Permite actualizar remolque para Remolques del Norte",
      action: "remolques_update", controller: "Items"},
    { name: "Ver detalle de remolque para Remolques del Norte",
      description: "Permite ver detalle de remolque para Remolques del Norte",
      action: "remolques_show", controller: "Items"},
    { name: "Eliminar remolque para Remolques del Norte",
      description: "Permite eliminar remolque para Remolques del Norte",
      action: "remolques_destroy", controller: "Items"},
    { name: "Exportar formato Microsip para Remolques del Norte",
      description: "Permite exportar Microsip para Remolques del Norte",
      action: "remolques_export_microsip", controller: "Items"},
]

permissions.each do |attrs|
  permission = Permission.find_by(action: attrs[:action], controller: attrs[:controller])
  permission = Permission.create(attrs) if permission.nil?
  PermissionRole.create(permission_id: permission.id, role_id: role_admin_remolques.id) if PermissionRole.find_by(permission_id: permission.id, role_id: role_admin_remolques.id).nil?
  PermissionRole.create(permission_id: permission.id, role_id: role_venedor_remolques.id) if PermissionRole.find_by(permission_id: permission.id, role_id: role_venedor_remolques.id).nil?
end

permissions_from_other_controllers = [
    { name: 'Ver la lista de remolques', description: 'Permite ver la lista de remolques',
      action: 'index', controller: 'Trailers' },
    { name: 'Ver la lista de tipos de remolques', description: 'Permite ver la lista de tipos de remolques',
      action: 'index', controller: 'TrailerTypes' },
    { name: 'Ver detalle de tipos de remolques', description: 'Permite ver detalle de tipos de remolques',
      action: 'show', controller: 'TrailerTypes' },
    { name: 'Ver la lista de tipos de piso', description: 'Permite ver la lista de tipos de piso',
      action: 'index', controller: 'FloorTypes' },
    { name: 'Ver la lista de tipos de rampas', description: 'Permite ver la lista de tipos de rampas',
      action: 'index', controller: 'RampTypes' },
    { name: 'Ver la lista de tipos de redilas', description: 'Permite ver la lista de tipos de redilas',
      action: 'index', controller: 'RedilaTypes' },
    { name: 'Ver la lista de capacidades', description: 'Permite ver la lista de capacidades',
      action: 'index', controller: 'Capacities' },
    { name: 'Ver la lista de anchos de trailers', description: 'Permite ver la lista de anchos de trailers',
      action: 'index', controller: 'TrailerWidths' },
    { name: 'Ver la lista de largos de trailers', description: 'Permite ver la lista de largos de trailers',
      action: 'index', controller: 'TrailerLengths' },
    { name: 'Ver la lista de tipos de frenos', description: 'Permite ver la lista de tipos de frenos',
      action: 'index', controller: 'BrakeTypes' },
    { name: 'Ver la lista de colores', description: 'Permite ver la lista de colores',
      action: 'index', controller: 'Colors' },
    { name: 'Ver la lista de tipos de divisiones', description: 'Permite ver la lista de tipos de divisiones',
      action: 'index', controller: 'DivitionTypes' },
    { name: 'Ver la lista de tipos de fenders', description: 'Permite ver la lista de tipos de fenders',
      action: 'index', controller: 'FenderTypes' },
    { name: 'Ver la lista de gatos hirdáulicos', description: 'Permite ver la lista de gatos hidráulicos',
      action: 'index', controller: 'HydraulicJacks' },
    { name: 'Ver la lista de tipos de jalones', description: 'Permite ver la lista de tipos de jalones',
      action: 'index', controller: 'PullTypes' },
    { name: 'Ver la lista de marcas', description: 'Permite ver la lista de marcas',
      action: 'index', controller: 'Brands' },
    { name: 'Ver la lista de techos', description: 'Permite ver la lista de techos',
      action: 'index', controller: 'RoofTypes' },
    { name: 'Ver la lista de suspensiones', description: 'Permite ver la lista de tipos de suspensiones',
      action: 'index', controller: 'SuspensionTypes' },
    { name: 'Ver la lista de volteos', description: 'Permite ver la lista de volteos',
      action: 'index', controller: 'TurnTypes' },
    { name: 'Obtener lista de departamentos por sucursal', description: 'Permite obtener lista de departamentos por sucursal',
      action: 'get_all_departments_by_branch', controller: 'Departments' },
    { name: 'Ver detalle de artículo', description: 'Permite ver detalle de artículo',
      action: 'show', controller: 'Items' },
    { name: 'Ver la lista de clientes', description: 'Permite ver la lista de clientes',
      action: 'index', controller: 'Client' },

]

permissions_from_other_controllers.each do |attrs|
  permission = Permission.find_by(action: attrs[:action], controller: attrs[:controller])
  permission = Permission.create(attrs) if permission.nil?
  PermissionRole.create(permission_id: permission.id, role_id: role_admin_remolques.id) if PermissionRole.find_by(permission_id: permission.id, role_id: role_admin_remolques.id).nil?
  PermissionRole.create(permission_id: permission.id, role_id: role_venedor_remolques.id) if PermissionRole.find_by(permission_id: permission.id, role_id: role_venedor_remolques.id).nil?
end

if User.find_by(email: 'admin_remolques@correo.com').nil?
  User.create(email: 'admin_remolques@correo.com', password: 'password', first_name: 'Remolques', last_name: 'Remolques',
              maiden_name: 'Remolques', employee_number: 1234567890, current_company: 'remolques',
              role_id: Role.find_by(key: 'admin_remolques')&.id)
end

if User.find_by(email: 'vendedor_remolques@correo.com').nil?
  User.create(email: 'vendedor_remolques@correo.com', password: 'password', first_name: 'Vendedor', last_name: 'Remolques',
              maiden_name: 'Remolques', employee_number: 123456789, current_company: 'remolques',
              role_id: Role.find_by(key: 'vendedor_remolques')&.id)
end
