
puts '==> Filling the \'Categories\' table...'

# Deletes all existing records.
Category.delete_all

# Restarts ids to 1.
ActiveRecord::Base.connection.reset_pk_sequence!('categories')

# Content.
# Category.create(name: 'MOBILIARIO DE OFICINA', description: 'MOBILIARIO DE OFICINA', status: 'true', company_id: 1)
# Category.create(name: 'EQUIPO DE CLIMATIZACIÓN', description: 'EQUIPO DE CLIMATIZACIÓN', status: 'true', company_id: 1)
# Category.create(name: 'EQUIPO DE ELECTRÓNICA', description: 'EQUIPO DE ELECTRÓNICA', status: 'true', company_id: 1)
# Category.create(name: 'TRANSPORTE', description: 'TRANSPORTE', status: 'true', company_id: 1)
# Category.create(name: 'OTROS', description: 'OTROS', status: 'true', company_id: 1)

Category.create(name: 'Cama Baja',  status: 'true', company_id: 1) 
Category.create(name: 'Ganaderos',  status: 'true', company_id: 1) 
Category.create(name: 'Caja Seca',  status: 'true', company_id: 1) 
Category.create(name: 'Carhauler',  status: 'true', company_id: 1) 
Category.create(name: 'Volteo',  status: 'true', company_id: 1) 
Category.create(name: 'Cama Alta Jalon Defensa',  status: 'true', company_id: 1) 
Category.create(name: 'Cama Alta Cuello de Ganso',  status: 'true', company_id: 1) 
Category.create(name: 'Caballos Sencillo',  status: 'true', company_id: 1) 
Category.create(name: 'Caballos Equipado',  status: 'true', company_id: 1) 