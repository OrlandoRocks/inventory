puts '==> Filling the \'Categories\' table...'

# Deletes all existing records.
SubCategory.delete_all

# Restarts ids to 1.
ActiveRecord::Base.connection.reset_pk_sequence!('subcategories')

# Content.
# Se inserta equipo de oficina
# SubCategory.create(name: 'Silla', description: 'Silla', status: 'true',category_id: 1 )
# SubCategory.create(name: 'Silla gerente', description: 'Silla gerente', status: 'true',category_id: 1 )
# SubCategory.create(name: 'Silla gerente', description: 'Silla gerente', status: 'true',category_id: 1 )
# SubCategory.create(name: 'Silla ejecutiva', description: 'Silla ejecutiva', status: 'true',category_id: 1)
# SubCategory.create(name: 'Silla de secretaria', description: 'Silla de secretaria', status: 'true',category_id: 1)
# SubCategory.create(name: 'Silla apilable', description: 'Silla apilable', status: 'true',category_id: 1)
# SubCategory.create(name: 'Silla plegable', description: 'Silla plegable', status: 'true',category_id: 1)
# SubCategory.create(name: 'Escritorio', description: 'Escritorio', status: 'true',category_id: 1)
# SubCategory.create(name: 'Escritorio en L', description: 'Escritorio en L', status: 'true',category_id: 1)
# SubCategory.create(name: 'Archivero', description: 'Archivero', status: 'true',category_id: 1)
# SubCategory.create(name: 'Archivero 2 cajones', description: 'Archivero 2 cajones', status: 'true',category_id: 1)
# SubCategory.create(name: 'Archivero 3 cajones', description: 'Archivero 3 cajones', status: 'true',category_id: 1)
# SubCategory.create(name: 'Archivero 4 cajones', description: 'Archivero 4 cajones', status: 'true',category_id: 1)
# SubCategory.create(name: 'Mesa plegable', description: 'Mesa plegable', status: 'true',category_id: 1)
# SubCategory.create(name: 'Mesa de trabajo', description: 'Mesa de trabajo', status: 'true',category_id: 1)
# SubCategory.create(name: 'Pizarrón', description: 'Pizarron', status: 'true',category_id: 1)
# SubCategory.create(name: 'Teléfono', description: 'Teléfono', status: 'true',category_id: 1)
#
# # Se inserta equipo de climatización
# SubCategory.create(name: 'Minisplit', description: 'Minisplit', status: 'true',category_id: 2)
# SubCategory.create(name: 'Aire acondicionado CELDEK', description: 'Aire acondicionado CELDEK', status: 'true',category_id: 2)
# SubCategory.create(name: 'Aire de ventana', description: 'Aire de ventana', status: 'true',category_id: 2)
# SubCategory.create(name: 'Calefacción', description: 'Calefacción', status: 'true',category_id: 2)
# SubCategory.create(name: 'Calefacciones', description: 'Calefacciones', status: 'true',category_id: 2)
# SubCategory.create(name: 'Unidades paquete', description: 'Unidades paquete', status: 'true',category_id: 2)
#
# # Se inserta equipo de transporte
# SubCategory.create(name: 'Vehículos', description: 'Vehículos', status: 'true',category_id: 4)
#
# SubCategory.create(name: 'Otros', description: 'Otros', status: 'true',category_id: 5)
# SubCategory.create(name: 'N/A', description: 'N/A', status: 'true',category_id: 5)


SubCategory.create(name: 'TELEFONOS (Oficina)', description: 'TELEFONOS (Oficina)', status: 'true',category_id: 1 )
SubCategory.create(name: 'PANTALLAS', description: 'PANTALLAS', status: 'true',category_id: 1 )
SubCategory.create(name: 'SILLAS EJECUTIVA', description: 'SILLAS EJECUTIVA', status: 'true',category_id: 1 )
SubCategory.create(name: 'SILLAS SECRETARIAL', description: 'SILLAS SECRETARIAL', status: 'true',category_id: 1 )
SubCategory.create(name: 'SILLAS ESTIBABLE', description: 'SILLAS ESTIBABLE', status: 'true',category_id: 1 )
SubCategory.create(name: 'ESCRITORIOS DE CRISTAL', description: 'ESCRITORIOS DE CRISTAL', status: 'true',category_id: 1 )
SubCategory.create(name: 'ESCRITORIOS DE MADERA', description: 'ESCRITORIOS DE MADERA', status: 'true',category_id: 1 )
SubCategory.create(name: 'ARCHIVEROS', description: 'ARCHIVEROS', status: 'true',category_id: 1 )
SubCategory.create(name: 'GABINETE', description: 'GABINETE', status: 'true',category_id: 1 )
SubCategory.create(name: 'LIBRERO', description: 'LIBRERO', status: 'true',category_id: 1 )
SubCategory.create(name: 'ALTAVOCES', description: 'ALTAVOCES', status: 'true',category_id: 1 )
SubCategory.create(name: 'MESA DE TRABAJO', description: 'MESA DE TRABAJO', status: 'true',category_id: 1 )
SubCategory.create(name: 'RACKS', description: 'RACKS', status: 'true',category_id: 1 )
SubCategory.create(name: 'SALA DE ESPERA', description: 'SALA DE ESPERA', status: 'true',category_id: 1 )
SubCategory.create(name: 'SILLONES', description: 'SILLONES', status: 'true',category_id: 1 )
SubCategory.create(name: 'PIZARRON', description: 'PIZARRON', status: 'true',category_id: 1 )
SubCategory.create(name: 'BANCAS DE ESPERA (Sillas Lineales)', description: 'BANCAS DE ESPERA (Sillas Lineales)', status: 'true',category_id: 1 )



#2
SubCategory.create(name: 'AUTOMOVIL', description: 'AUTOMOVIL', status: 'true',category_id: 2 )
SubCategory.create(name: 'PICKUP', description: 'PICKUP', status: 'true',category_id: 2 )
SubCategory.create(name: 'CAMIONETAS', description: 'CAMIONETAS', status: 'true',category_id: 2 )

#3
SubCategory.create(name: 'PANELES SOLARES', description: 'PANELES SOLARES', status: 'true',category_id: 3 )
SubCategory.create(name: 'EXTINTOR', description: 'EXTINTOR', status: 'true',category_id: 3 )
SubCategory.create(name: 'CLIMA', description: 'CLIMA', status: 'true',category_id: 3 )
SubCategory.create(name: 'ALARMA', description: 'ALARMA', status: 'true',category_id: 3 )
SubCategory.create(name: 'GPS', description: 'GPS', status: 'true',category_id: 3 )
SubCategory.create(name: 'ENTRETENIMIENTO', description: 'ENTRETENIMIENTO', status: 'true',category_id: 3 )
SubCategory.create(name: 'ARTICULOS UTILITARIOS', description: 'ARTICULOS UTILITARIOS', status: 'true',category_id: 3 )
SubCategory.create(name: 'REFRIGERADOR', description: 'REFRIGERADOR', status: 'true',category_id: 3 )
SubCategory.create(name: 'MICROONDAS', description: 'MICROONDAS', status: 'true',category_id: 3 )


#4
SubCategory.create(name: 'SERVIDORES', description: 'SERVIDORES', status: 'true',category_id: 4 )
SubCategory.create(name: 'BIOMETRICO (Lector de Huella)', description: 'BIOMETRICO (Lector de Huella)', status: 'true',category_id: 4 )
SubCategory.create(name: 'UPS (Fuente de Respaldo)', description: 'UPS (Fuente de Respaldo)', status: 'true',category_id: 4 )
SubCategory.create(name: 'EQUIPO DE COMUNICACION', description: 'EQUIPO DE COMUNICACION', status: 'true',category_id: 4 )
SubCategory.create(name: 'IMPRESORAS', description: 'IMPRESORAS', status: 'true',category_id: 4 )
SubCategory.create(name: 'MONITORES', description: 'MONITORES', status: 'true',category_id: 4 )
SubCategory.create(name: 'LAPTOPs', description: 'LAPTOPs', status: 'true',category_id: 4 )
SubCategory.create(name: 'COMPUTADORA DE ESCRITORIO', description: 'COMPUTADORA DE ESCRITORIO', status: 'true',category_id: 4 )
SubCategory.create(name: 'UNIDAD DE BACKUP (Respaldo Informacion)', description: 'UNIDAD DE BACKUP (Respaldo Informacion)', status: 'true',category_id: 4 )
SubCategory.create(name: 'ACCESORIOS (Teclado, Raton)', description: 'ACCESORIOS (Teclado, Raton)', status: 'true',category_id: 4 )
SubCategory.create(name: 'MEMORIA USB', description: 'MEMORIA USB', status: 'true',category_id: 4 )
SubCategory.create(name: 'DISCO DURO EXTERNO', description: 'DISCO DURO EXTERNO', status: 'true',category_id: 4 )
SubCategory.create(name: 'TABLETS', description: 'TABLETS', status: 'true',category_id: 4 )
SubCategory.create(name: 'DISPOSITIVOS DE INTERCONEXION(Red)', description: 'DISPOSITIVOS DE INTERCONEXION(Red)', status: 'true',category_id: 4 )
SubCategory.create(name: 'CONMUTADOR', description: 'CONMUTADOR', status: 'true',category_id: 4 )
SubCategory.create(name: 'MEMORIA RAM', description: 'MEMORIA RAM', status: 'true',category_id: 4 )
SubCategory.create(name: 'PROYECTOR', description: 'PROYECTOR', status: 'true',category_id: 4 )
SubCategory.create(name: 'MULTIFUNCIONAL', description: 'MULTIFUNCIONAL', status: 'true',category_id: 4 )
SubCategory.create(name: 'CAMARAS DE SEGURIDAD', description: 'CAMARAS DE SEGURIDAD', status: 'true',category_id: 4 )
SubCategory.create(name: 'BATERIA EXTERNA (CELULAR)', description: 'BATERIA EXTERNA (CELULAR)', status: 'true',category_id: 4 )
SubCategory.create(name: 'CELULARES', description: 'CELULARES', status: 'true',category_id: 4 )


#5
SubCategory.create(name: 'PROGRAMAS', description: 'PROGRAMAS', status: 'true',category_id: 5)
SubCategory.create(name: 'LICENCIAS', description: 'LICENCIAS', status: 'true',category_id: 5 )
