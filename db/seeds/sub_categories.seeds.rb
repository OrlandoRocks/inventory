puts '==> Filling the \'Categories\' table...'

# Deletes all existing records.
SubCategory.delete_all

# Restarts ids to 1.
ActiveRecord::Base.connection.reset_pk_sequence!('subcategories')

# Content.

#2
SubCategory.create(name: 'REDILAS', description: 'REDILAS', status: 'true',category_id: 1 )
SubCategory.create(name: 'CABALLOS', description: 'CABALLOS', status: 'true',category_id: 1)
SubCategory.create(name: 'ABIERTOS', description: 'ABIERTOS', status: 'true',category_id: 1 )

