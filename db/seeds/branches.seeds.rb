# after :cities do
  puts '==> Filling the \'Branches\' table...'

  # Deletes all existing records.
  Branch.delete_all

  # Restarts ids to 1.
  ActiveRecord::Base.connection.reset_pk_sequence!('branches')

  # Content.

  #2
  Branch.create(name: 'Cuauhtemoc', description: '' , city_id: 200)
  Branch.create(name: 'Alchichica', description: '' ,  city_id: 1646)
  Branch.create(name: 'Arteaga', description: '',  city_id: 33)
  Branch.create(name: 'Monclova', description: '', city_id: 42)
  Branch.create(name: 'Cueramaro', description: '', city_id: 331)
  Branch.create(name: 'Irapuato', description: '' , city_id: 327)
  Branch.create(name: 'CDMX', description: '', city_id: 739)

# end
