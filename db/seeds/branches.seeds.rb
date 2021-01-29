# after :cities do
  puts '==> Filling the \'Branches\' table...'

  # Deletes all existing records.
  Branch.delete_all

  # Restarts ids to 1.
  ActiveRecord::Base.connection.reset_pk_sequence!('branches')

  # Content.

  #2
  Branch.create(name: 'Cuauhtemoc', description: '' , state_id: State.where(name:"Chihuahua").first.id, city_id: 200, company_id: 1 )
  Branch.create(name: 'Alchichica', description: '' , state_id: State.where(name:"Puebla").first.id, city_id: 1646, company_id: 1 )
  Branch.create(name: 'Arteaga', description: '', state_id: State.where(name:"Coahuila").first.id, city_id: 33, company_id: 1 )
  Branch.create(name: 'Monclova', description: '', state_id: State.where(name:"Coahuila").first.id, city_id: 42, company_id: 1 )
  Branch.create(name: 'Cueramaro', description: '', state_id: State.where(name:"Guanajuato").first.id, city_id: 331, company_id: 1)
  Branch.create(name: 'Irapuato', description: '' , state_id: State.where(name:"Guanajuato").first.id, city_id: 327, company_id: 1 )
  Branch.create(name: 'CDMX', description: '', state_id: State.where(name:"Mexico").first.id, city_id: 739, company_id: 1 )

# end
