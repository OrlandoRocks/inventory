after :cities do
  puts '==> Filling the \'Branches\' table...'

  # Deletes all existing records.
  Branch.delete_all

  # Restarts ids to 1.
  ActiveRecord::Base.connection.reset_pk_sequence!('branches')

  # Content.

  #2
  Branch.create(name: 'Alchichica, Puebla', status: 'true',category_id: 1 )
  Branch.create(name: 'Saltillo, Coahuila', description: 'CABALLOS', status: 'true',category_id: 1)
  Branch.create(name: 'Saltillo, Coahuila', description: 'ABIERTOS', status: 'true',category_id: 1 )
  Branch.create(name: 'Irapuato, Guananjuato', description: 'ABIERTOS', status: 'true',category_id: 1 )

end
