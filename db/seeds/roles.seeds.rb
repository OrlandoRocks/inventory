# Valores por si es necesario un update
#Role.where(key: 'admin_empresa').update_all name:'Director'
#Role.where(key: 'admin_sucursal').update_all name:'Gerente'
#Role.where(key: 'admin_departamento').update_all name:'Coordinador'
#Role.where(key: 'empleado_sin_acceso').update_all name:'Empleado Responsable'



puts '==> Filling the \'roles\' table...'

# Deletes all existing records.
Role.delete_all

# Restarts ids to 1.
ActiveRecord::Base.connection.reset_pk_sequence!('roles')

# Content.
Role.create(name: 'God', key: 'god', description: 'Super administrador del sistema. Tiene acceso a todo y superpoderes.',
            scope: 0)
Role.create(name: 'Administrador General', key: 'admin', description: 'Administrador general del corporativo.', scope: 0)
Role.create(name: 'Gerente', key: 'admin_sucursal', description: 'Administrador de Sucursal.', scope: 0)
Role.create(name: 'Vendedor', key: 'empleado_sin_acceso', description: 'Empleado sin acceso al sistema.', scope: 0)
