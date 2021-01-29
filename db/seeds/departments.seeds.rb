after :branches do
  puts '==> Filling the \'Departments\' table...'

  # Deletes all existing records.
  Department.delete_all

  # Restarts ids to 1.
  ActiveRecord::Base.connection.reset_pk_sequence!('departments')

  # Content.

  #2
  Department.create(name: 'Oficina Central' , description: 'Km 7 Corredor Comercial, Ciudad Cuauhtémoc Chihuahua', status: 'true',branch_id: Branch.where(name:'Cuauhtémoc').first.id)
  Department.create(name: 'Alchichica'      , description: 'Carretera Federal México-Veracruz Km 52 SN.  C.P. 73996', status: 'true',branch_id: Branch.where(name:'Alchichica').first.id)
  Department.create(name: 'Arteaga'         , description: 'Carretera 57  Km 13 Saltillo, Coahuila C.P. 25350', status: 'true',branch_id: Branch.where(name:'Arteaga').first.id)
  Department.create(name: 'Monclova'        , description: 'Blvd. Francisco Madero #1507 Monclova, Coahuila. C.P. 25750', status: 'true',branch_id: Branch.where(name:'Monclova').first.id)
  Department.create(name: 'Cuerámaro'       , description: 'Carretera Estatal Cuerámaro #1343 Cuerámaro, Guanajuato. C.P. 36960', status: 'true',branch_id: Branch.where(name:'Cuerámaro').first.id)
  Department.create(name: 'Irapuato'        , description: 'Blvd. Solidaridad #5011 Irapuato, Guanajuato. C.P. 36826', status: 'true',branch_id: Branch.where(name:'Irapuato').first.id)
  Department.create(name: 'Tultitlán'       , description: 'Vía José López Portillo Km 23 San Mateo Cuautepec Tultitlán, Edo Mex. C.P. 54948', status: 'true',branch_id: Branch.where(name:'CDMX').first.id)
  Department.create(name: 'Hasta Bandera'   , description: 'Vía José López Portillo Km 21 Colonia Buenavista Tultitlán, Edo Mex. C.P. 54944', status: 'true',branch_id: Branch.where(name:'CDMX').first.id)

end
