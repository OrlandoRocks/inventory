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


Category.create(name: 'REMOLEQUES', description: 'TRAILERS', status: 'true', company_id: 1)
