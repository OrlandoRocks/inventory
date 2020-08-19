puts '==> Filling the \'status_items\' table...'

# Deletes all existing records.
StatusItem.delete_all

# Restarts ids to 1.
ActiveRecord::Base.connection.reset_pk_sequence!('status_items')

# Content.
StatusItem.create(name: 'Vendido', description: 'Vendido',key:'vendido')
StatusItem.create(name: 'No Vendido', description: 'No Vendido',key:'no_vendido')
StatusItem.create(name: 'Vendido y Pendiente de Factura', description: 'Vendido y Pendiente de Factura',key:'pendiente')
StatusItem.create(name: 'Seminuevo', description: 'Semi nuevo',key:'seminuevo')
StatusItem.create(name: 'Viejo', description: 'Viejo',key:'viejo')
StatusItem.create(name: 'Malas condiciones', description: 'Malas condiciones',key:'malas_condiciones')
StatusItem.create(name: 'Baja', description: 'Baja del artículo',key:'baja')
