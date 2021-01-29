after :cities do
  puts '==> Filling the \'Branches\' table...'

  # Deletes all existing records.
  Branch.delete_all

  # Restarts ids to 1.
  ActiveRecord::Base.connection.reset_pk_sequence!('branches')

  # Content.

  #2
  Branch.create(name: 'Cuauhtémoc', description: '', status: 'true',state_i: State.where(name:"Chihuahua").first.id, city_id: City.where(name:"Cuauhtémoc").first.id )
  Branch.create(name: 'Alchichica', description: '', status: 'true',state_i: State.where(name:"Puebla").first.id, city_id: City.where(name:"Tepeyahualco").first.id )
  Branch.create(name: 'Arteaga', description: '', status: 'true'   ,state_i: State.where(name:"Coahuila").first.id, city_id: City.where(name:"Saltillo").first.id )
  Branch.create(name: 'Monclova', description: '', status: 'true'  ,state_i: State.where(name:"Coahuila").first.id, city_id: City.where(name:"Monclova").first.id )
  Branch.create(name: 'Cuerámaro', description: '', status: 'true' ,state_i: State.where(name:"Guanajuato").first.id, city_id: City.where(name:"Cuerámaro").first.id )
  Branch.create(name: 'Irapuato', description: '', status: 'true'  ,state_i: State.where(name:"Guanajuato").first.id, city_id: City.where(name:"Irapuato").first.id )
  Branch.create(name: 'CDMX', description: '', status: 'true'      ,state_i: State.where(name:"México").first.id, city_id: City.where(name:"Tultitlán").first.id )

end
