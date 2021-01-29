after :cities do
  puts '==> Filling the \'Branches\' table...'

  # Deletes all existing records.
  Branch.delete_all

  # Restarts ids to 1.
  ActiveRecord::Base.connection.reset_pk_sequence!('branches')

  # Content.

  #2
  Branch.create(name: 'Cuauhtemoc', description: '' ,state_id: State.where(name:"Chihuahua").first.id, city_id: City.where(name:"Cuauhtemoc").first.id )
  Branch.create(name: 'Alchichica', description: '' ,state_id: State.where(name:"Puebla").first.id, city_id: City.where(name:"Tepeyahualco").first.id )
  Branch.create(name: 'Arteaga', description: ''       ,state_id: State.where(name:"Coahuila").first.id, city_id: City.where(name:"Saltillo").first.id )
  Branch.create(name: 'Monclova', description: ''     ,state_id: State.where(name:"Coahuila").first.id, city_id: City.where(name:"Monclova").first.id )
  Branch.create(name: 'Cueramaro', description: ''   ,state_id: State.where(name:"Guanajuato").first.id, city_id: City.where(name:"Cueramaro").first.id )
  Branch.create(name: 'Irapuato', description: ''     ,state_id: State.where(name:"Guanajuato").first.id, city_id: City.where(name:"Irapuato").first.id )
  Branch.create(name: 'CDMX', description: ''             ,state_id: State.where(name:"Mexico").first.id, city_id: City.where(name:"Tultitlan").first.id )

end
