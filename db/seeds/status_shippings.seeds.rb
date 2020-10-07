puts '==> Filling the \'status_items\' table...'

# Deletes all existing records.
StatusShipping.delete_all

# Restarts ids to 1.
ActiveRecord::Base.connection.reset_pk_sequence!('status_shippings')

# Content.
StatusShipping.create(name: 'Pedido', description: 'Articulo Pedido',key:'pedido')
StatusShipping.create(name: 'Enviado', description: 'Articulo Enviado',key:'enviado')
StatusShipping.create(name: 'Recibido', description: 'Articulo Recibido',key:'recibido')
