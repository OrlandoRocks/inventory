# after :cities do
  puts '==> Filling the \'Branches\' table...'

  # Deletes all existing records.
  Branch.delete_all

  # Restarts ids to 1.
  ActiveRecord::Base.connection.reset_pk_sequence!('branches')

  # Content.

  #2
  Branch.create(name: 'Cuauhtémoc', description: '' , state_id: State.where(name:"Chihuahua").first.id, city_id: 200 )
  Branch.create(name: 'Alchichica', description: '' , state_id: State.where(name:"Puebla").first.id, city_id: 1646 )
  Branch.create(name: 'Arteaga', description: '', state_id: State.where(name:"Coahuila").first.id, city_id: 33 )
  Branch.create(name: 'Monclova', description: '', state_id: State.where(name:"Coahuila").first.id, city_id: 42 )
  Branch.create(name: 'Cuerámaro', description: '', state_id: State.where(name:"Guanajuato").first.id, city_id: 331)
  Branch.create(name: 'Irapuato', description: '' , state_id: State.where(name:"Guanajuato").first.id, city_id: 327 )
  Branch.create(name: 'CDMX', description: '', state_id: State.where(name:"Mexico").first.id, city_id: 739 )

# end
