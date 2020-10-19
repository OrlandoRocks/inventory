# after :categories do
puts '==> Filling the \'Sub Categories\' table...'

# Deletes all existing records.
TrailerType.delete_all

# Restarts ids to 1.
ActiveRecord::Base.connection.reset_pk_sequence!('trailer_types')

# Content.

#2
TrailerType.create(name: 'Cama Baja',  status: 'true')
TrailerType.create(name: 'Ganaderos',  status: 'true')
TrailerType.create(name: 'Caja Seca',  status: 'true')
TrailerType.create(name: 'Carhauler',  status: 'true')
TrailerType.create(name: 'Volteo',  status: 'true')
TrailerType.create(name: 'Cama Alta Jalon Defensa',  status: 'true')
TrailerType.create(name: 'Cama Alta Cuello de Ganso',  status: 'true')
TrailerType.create(name: 'Caballos Sencillo',  status: 'true')
TrailerType.create(name: 'Caballos Equipado',  status: 'true')

# end
