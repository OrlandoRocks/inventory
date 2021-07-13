puts '==> Filling the \'status_items\' table...'

# Deletes all existing records.
StatusItem.delete_all

# Restarts ids to 1.
ActiveRecord::Base.connection.reset_pk_sequence!('status_items')

# Content.
StatusItem.create(name: 'Vendido', description: 'Vendido',key:'vendido')
StatusItem.create(name: 'No Vendido', description: 'No Vendido',key:'no_vendido')
StatusItem.create(name: 'Vendido a Credito', description: 'Vendido a Credito',key:'vendido_credito')
StatusItem.create(name: 'Vendido y Pendiente de Factura', description: 'Vendido y Pendiente de Factura',key:'pendiente_factura')
StatusItem.create(name: 'Vendido y Facturado', description: 'Vendido y Facturado',key:'facturado')
StatusItem.create(name: 'Articulo Pendiente', description: 'Articulo Pendiente',key:'pendiente')
StatusItem.create(name: 'Vendido por credito', description: 'Vendido por credito',key:'vendido_credito')
