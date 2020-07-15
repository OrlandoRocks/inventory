puts '==> Filling the \'tormenz group\' table...'

# Deletes all existing records.
#Category.delete_all

# Restarts ids to 1.
#ActiveRecord::Base.connection.reset_pk_sequence!('categories')

# Content.

u = User.create(email: 'admin_tormenz@example.com', username: 'admin', first_name: 'Admin Tormenz', last_name: 'Admin Tormenz',
            maiden_name: 'Admin Tormenz', role_id: Role.find_by_key('admin_empresa').id, password: 'password',
            confirmed_at: Time.now, sign_in_count: 0)
Company.create(name: "Grupo Tormenz",description:"Grupo Tormenz", user_id: u.id)
puts "==> Filling the -->COMPANY  TABLE <--- ...#{Company.where(name: "Grupo Tormenz").first.id}"

after :cities, :user_tormenz do
  puts '==> Filling the -->BRANCH TABLE <--- ..'
  Branch.create(name:"BC-Tijuana",description:"BC-Tijuana",city_id: City.where(name:"Tijuana").first.id,company_id: Company.where(name: "Grupo Tormenz").first.id, state_id: State.where(name: "Baja California").first.id, manager_id: User.where(first_name: "Susana").first.id)
  Branch.create(name:"Sonora-Nogales",description:"Sonora-Nogales",city_id: City.where(name:"Nogales").first.id,company_id: Company.where(name: "Grupo Tormenz").first.id, state_id: State.where(name: "Sonora").first.id, manager_id: User.where(first_name: "Consuelo").first.id)
  Branch.create(name:"Sonora-Hermosillo",description:"Sonora-Hermosillo",city_id: City.where(name:"Hermosillo").first.id,company_id: Company.where(name: "Grupo Tormenz").first.id, state_id: State.where(name: "Sonora").first.id, manager_id: User.where(first_name: "Jannette").first.id)
  Branch.create(name:"Chihuahua-Juárez",description:"Chihuahua-Juárez",city_id: City.where("name = ? And state_id = ?","Juárez",State.where(name: "Chihuahua").first.id).first.id,company_id: Company.where(name: "Grupo Tormenz").first.id, state_id: State.where(name: "Chihuahua").first.id, manager_id: User.where(first_name: "Luz").first.id)
  Branch.create(name:"Chihuahua-Juárez",description:"Chihuahua-Juárez",city_id: City.where("name = ? And state_id = ?","Juárez",State.where(name: "Chihuahua").first.id).first.id,company_id: Company.where(name: "Grupo Tormenz").first.id, state_id: State.where(name: "Chihuahua").first.id, manager_id: User.where(first_name: "Felipe").first.id)
  Branch.create(name:"Chihuahua-Chihuahua",description:"Chihuahua-Chihuahua",city_id: City.where(name:"Chihuahua").first.id,company_id: Company.where(name: "Grupo Tormenz").first.id, state_id: State.where(name: "Chihuahua").first.id, manager_id: User.where(first_name: "Daniel").first.id)

  # >>>>>>>>>>>> Falta este manager
  Branch.create(name:"Chihuahua-Corredor Sur (Delicias)",description:"Chihuahua-Corredor Sur (Delicias)",city_id: City.where(name:"Delicias").first.id,company_id: Company.where(name: "Grupo Tormenz").first.id, state_id: State.where(name: "Chihuahua").first.id, manager_id: User.where(first_name: "Daniel").first.id)

  Branch.create(name:"Durango-Durango",description:"Durango-Durango",city_id: City.where(name:"Durango").first.id,company_id: Company.where(name: "Grupo Tormenz").first.id, state_id: State.where(name: "Durango").first.id, manager_id: User.where(first_name: "Francia").first.id)
  Branch.create(name:"Durango-Gómez Palacio",description:"Durango-Gómez Palacio",city_id: City.where(name:"Gómez Palacio").first.id,company_id: Company.where(name: "Grupo Tormenz").first.id, state_id: State.where(name: "Durango").first.id, manager_id: User.where(first_name: "Ilse").first.id)
  Branch.create(name:"Coahuila-Torreón",description:"Coahuila-Torreón",city_id: City.where(name:"Torreón").first.id,company_id: Company.where(name: "Grupo Tormenz").first.id, state_id: State.where(name: "Coahuila").first.id, manager_id: User.where(first_name: "Erika").first.id)
  Branch.create(name:"Coahuila-Saltillo",description:"Coahuila-Saltillo",city_id: City.where(name:"Saltillo").first.id,company_id: Company.where(name: "Grupo Tormenz").first.id, state_id: State.where(name: "Coahuila").first.id, manager_id: User.where(first_name: "Mariana").first.id)
  Branch.create(name:"Nuevo León-Monterrey",description:"Nuevo León-Monterrey",city_id: City.where(name:"Monterrey").first.id,company_id: Company.where(name: "Grupo Tormenz").first.id, state_id: State.where(name: "Nuevo León").first.id, manager_id: User.where(first_name: "Karla").first.id)
  Branch.create(name:"Tamaulipas-Reynosa",description:"Tamaulipas-Reynosa",city_id: City.where(name:"Reynosa").first.id,company_id: Company.where(name: "Grupo Tormenz").first.id, state_id: State.where(name: "Tamaulipas").first.id, manager_id: User.where(first_name: "Pilar").first.id)

  # >>>>>>>>>>>> Falta este manager
  Branch.create(name:"Jalisco-Guadalajara",description:"Jalisco-Guadalajara",city_id: City.where(name:"Guadalajara").first.id,company_id: Company.where(name: "Grupo Tormenz").first.id, state_id: State.where(name: "Jalisco").first.id, manager_id: User.where(first_name: "Daniel").first.id)

  Branch.create(name:"Querétaro-Querétaro",description:"Querétaro-Querétaro",city_id: City.where(name:"Querétaro").first.id,company_id: Company.where(name: "Grupo Tormenz").first.id, state_id: State.where(name: "Querétaro").first.id, manager_id: User.where(first_name: "Rodolfo").first.id)
  Branch.create(name:"San Luis Potosí-San Luis Potosí",description:"San Luis Potosí-San Luis Potosí",city_id: City.where(name:"San Luis Potosí").first.id,company_id: Company.where(name: "Grupo Tormenz").first.id, state_id: State.where(name: "San Luis Potosí").first.id, manager_id: User.where(first_name: "Miguel Angel").first.id)

  # >>>>>>>>>>>> Falta este manager
  Branch.create(name:"Ciudad de México",description:"Ciudad de México",city_id: City.where(name:"CDMX").first.id,company_id: Company.where(name: "Grupo Tormenz").first.id, state_id: State.where(name: "México").first.id, manager_id: User.where(first_name: "Daniel").first.id)

  Branch.create(name:"Guerrero-Acapulco",description:"Guerrero-Acapulco",city_id: City.where(name:"Acapulco").first.id,company_id: Company.where(name: "Grupo Tormenz").first.id, state_id: State.where(name: "Guerrero").first.id, manager_id: User.where(first_name: "Erika").first.id)
  Branch.create(name:"Tabasco-Villahermosa",description:"Tabasco-Villahermosa",city_id: City.where(name:"Villahermosa").first.id,company_id: Company.where(name: "Grupo Tormenz").first.id, state_id: State.where(name: "Tabasco").first.id, manager_id: User.where(first_name: "Emmanuel").first.id)
  Branch.create(name:"Yucatán-Mérida",description:"Yucatán-Mérida",city_id: City.where(name:"Mérida").first.id,company_id: Company.where(name: "Grupo Tormenz").first.id, state_id: State.where(name: "Yucatán").first.id, manager_id: User.where(first_name: "Paola").first.id)
  puts '==> END -- Filling the -->BRANCH TABLE <--- ..'



  puts '==> Filling the -->BRANCH TABLE <--- ..'
  Department.create(name:"Judicial", description: "Judicial", branch_id: Branch.where(city_id: City.where(name:"Tijuana").first.id).first.id)
  Department.create(name:"Extrajudicial", description: "Extrajudicial", branch_id: Branch.where(city_id: City.where(name:"Tijuana").first.id).first.id)
  Department.create(name:"Proceso Judicial Masivo", description: "Proceso Judicial Masivo", branch_id: Branch.where(city_id: City.where(name:"Tijuana").first.id).first.id)


  Department.create(name:"Extrajudicial", description: "Extrajudicial", branch_id: Branch.where(city_id: City.where(name:"Nogales").first.id).first.id)
  Department.create(name:"Proceso Judicial Masivo", description: "Proceso Judicial Masivo", branch_id: Branch.where(city_id: City.where(name:"Nogales").first.id).first.id)

  Department.create(name:"Judicial", description: "Judicial", branch_id: Branch.where(city_id: City.where(name:"Hermosillo").first.id).first.id)
  Department.create(name:"Extrajudicial", description: "Extrajudicial", branch_id: Branch.where(city_id: City.where(name:"Hermosillo").first.id).first.id)
  Department.create(name:"Cobranza Fiscal y Titulación", description: "Cobranza Fiscal y Titulación", branch_id: Branch.where(city_id: City.where(name:"Hermosillo").first.id).first.id)
  Department.create(name:"Proceso Judicial Masivo", description: "Proceso Judicial Masivo", branch_id: Branch.where(city_id: City.where(name:"Hermosillo").first.id).first.id)

  Department.create(name:"Judicial", description: "Judicial", branch_id:  Branch.where(city_id:  City.where("name = ? And state_id = ?","Juárez", State.where(name: "Chihuahua").first.id).first.id).first.id)
  Department.create(name:"Proceso Judicial Masivo", description: "Proceso Judicial Masivo", branch_id:  Branch.where(city_id:  City.where("name = ? And state_id = ?","Juárez", State.where(name: "Chihuahua").first.id).first.id).first.id)

  Department.create(name:"Extrajudicial", description: "Judicial", branch_id: Branch.where(city_id:  City.where("name = ? And state_id = ?","Juárez", State.where(name: "Chihuahua").first.id).first.id).first.id)
  Department.create(name:"Proceso Judicial Masivo", description: "Proceso Judicial Masivo", branch_id: Branch.where(city_id: City.where("name = ? And state_id = ?","Juárez",State.where(name: "Chihuahua").first.id).first.id).first.id)

  Department.create(name:"Judicial", description: "Judicial", branch_id: Branch.where(city_id: City.where(name:"Chihuahua").first.id).first.id)
  Department.create(name:"Extrajudicial", description: "Extrajudicial", branch_id: Branch.where(city_id: City.where(name:"Chihuahua").first.id).first.id)
  Department.create(name:"Cobranza Fiscal y Titulación", description: "Cobranza Fiscal y Titulación", branch_id: Branch.where(city_id: City.where(name:"Chihuahua").first.id).first.id)
  Department.create(name:"Apertura de crédito", description: "Apertura de crédito", branch_id: Branch.where(city_id: City.where(name:"Chihuahua").first.id).first.id)
  Department.create(name:"Proceso Judicial Masivo", description: "Proceso Judicial Masivo", branch_id: Branch.where(city_id: City.where(name:"Chihuahua").first.id).first.id)


  Department.create(name:"Judicial", description: "Judicial", branch_id: Branch.where(city_id: City.where(name:"Delicias").first.id).first.id)
  Department.create(name:"Extrajudicial", description: "Extrajudicial", branch_id: Branch.where(city_id: City.where(name:"Chihuahua").first.id).first.id)
  Department.create(name:"Proceso Judicial Masivo", description: "Proceso Judicial Masivo", branch_id: Branch.where(city_id: City.where(name:"Chihuahua").first.id).first.id)

  Department.create(name:"Judicial", description: "Judicial", branch_id: Branch.where(city_id: City.where(name:"Durango").first.id).first.id)
  Department.create(name:"Extrajudicial", description: "Extrajudicial", branch_id: Branch.where(city_id: City.where(name:"Durango").first.id).first.id)
  Department.create(name:"Cobranza Fiscal y Titulación", description: "Cobranza Fiscal y Titulación", branch_id: Branch.where(city_id: City.where(name:"Durango").first.id).first.id)
  Department.create(name:"Apertura de crédito", description: "Apertura de crédito", branch_id: Branch.where(city_id: City.where(name:"Durango").first.id).first.id)
  Department.create(name:"Proceso Judicial Masivo", description: "Proceso Judicial Masivo", branch_id: Branch.where(city_id: City.where(name:"Durango").first.id).first.id)

  Department.create(name:"Judicial", description: "Judicial", branch_id: Branch.where(city_id: City.where(name:"Gómez Palacio").first.id).first.id)
  Department.create(name:"Extrajudicial", description: "Extrajudicial", branch_id: Branch.where(city_id: City.where(name:"Gómez Palacio").first.id).first.id)
  Department.create(name:"Cobranza Fiscal y Titulación", description: "Cobranza Fiscal y Titulación", branch_id: Branch.where(city_id: City.where(name:"Gómez Palacio").first.id).first.id)
  Department.create(name:"Apertura de crédito", description: "Apertura de crédito", branch_id: Branch.where(city_id: City.where(name:"Gómez Palacio").first.id).first.id)
  Department.create(name:"Proceso Judicial Masivo", description: "Proceso Judicial Masivo", branch_id: Branch.where(city_id: City.where(name:"Gómez Palacio").first.id).first.id)

  Department.create(name:"Judicial", description: "Judicial", branch_id: Branch.where(city_id: City.where(name:"Torreón").first.id).first.id)
  Department.create(name:"Extrajudicial", description: "Extrajudicial", branch_id: Branch.where(city_id: City.where(name:"Torreón").first.id).first.id)
  Department.create(name:"Proceso Judicial Masivo", description: "Proceso Judicial Masivo", branch_id: Branch.where(city_id: City.where(name:"Torreón").first.id).first.id)


  Department.create(name:"Judicial", description: "Judicial", branch_id: Branch.where(city_id: City.where(name:"Saltillo").first.id).first.id)
  Department.create(name:"Extrajudicial", description: "Extrajudicial", branch_id: Branch.where(city_id: City.where(name:"Saltillo").first.id).first.id)
  Department.create(name:"Proceso Judicial Masivo", description: "Proceso Judicial Masivo", branch_id: Branch.where(city_id: City.where(name:"Saltillo").first.id).first.id)


  Department.create(name:"Judicial", description: "Judicial", branch_id: Branch.where(city_id: City.where(name:"Monterrey").first.id).first.id)
  Department.create(name:"Extrajudicial", description: "Extrajudicial", branch_id: Branch.where(city_id: City.where(name:"Monterrey").first.id).first.id)
  Department.create(name:"Proceso Judicial Masivo", description: "Proceso Judicial Masivo", branch_id: Branch.where(city_id: City.where(name:"Monterrey").first.id).first.id)

  Department.create(name:"Judicial", description: "Judicial", branch_id: Branch.where(city_id: City.where(name:"Reynosa").first.id).first.id)
  Department.create(name:"Extrajudicial", description: "Extrajudicial", branch_id: Branch.where(city_id: City.where(name:"Reynosa").first.id).first.id)
  Department.create(name:"Proceso Judicial Masivo", description: "Proceso Judicial Masivo", branch_id: Branch.where(city_id: City.where(name:"Reynosa").first.id).first.id)

  Department.create(name:"Judicial", description: "Judicial", branch_id: Branch.where(city_id: City.where(name:"Guadalajara").first.id).first.id)
  Department.create(name:"Cobranza Fiscal y Titulación", description: "Cobranza Fiscal y Titulación", branch_id: Branch.where(city_id: City.where(name:"Guadalajara").first.id).first.id)
  Department.create(name:"Apertura de crédito", description: "Apertura de crédito", branch_id: Branch.where(city_id: City.where(name:"Guadalajara").first.id).first.id)
  Department.create(name:"Proceso Judicial Masivo", description: "Proceso Judicial Masivo", branch_id: Branch.where(city_id: City.where(name:"Guadalajara").first.id).first.id)


  Department.create(name:"Judicial", description: "Judicial", branch_id: Branch.where(city_id: City.where(name:"Querétaro").first.id).first.id)
  Department.create(name:"Extrajudicial", description: "Extrajudicial", branch_id: Branch.where(city_id: City.where(name:"Querétaro").first.id).first.id)
  Department.create(name:"Proceso Judicial Masivo", description: "Proceso Judicial Masivo", branch_id: Branch.where(city_id: City.where(name:"Querétaro").first.id).first.id)

  Department.create(name:"Judicial", description: "Judicial", branch_id: Branch.where(city_id: City.where(name:"San Luis Potosí").first.id).first.id)
  Department.create(name:"Extrajudicial", description: "Extrajudicial", branch_id: Branch.where(city_id: City.where(name:"San Luis Potosí").first.id).first.id)
  Department.create(name:"Proceso Judicial Masivo", description: "Proceso Judicial Masivo", branch_id: Branch.where(city_id: City.where(name:"San Luis Potosí").first.id).first.id)


  Department.create(name:"Proceso Judicial Masivo", description: "Proceso Judicial Masivo", branch_id: Branch.where(city_id: City.where(name:"CDMX").first.id).first.id)

  Department.create(name:"Judicial", description: "Judicial", branch_id: Branch.where(city_id: City.where(name:"Acapulco").first.id).first.id)
  Department.create(name:"Extrajudicial", description: "Extrajudicial", branch_id: Branch.where(city_id: City.where(name:"Acapulco").first.id).first.id)
  Department.create(name:"Proceso Judicial Masivo", description: "Proceso Judicial Masivo", branch_id: Branch.where(city_id: City.where(name:"Acapulco").first.id).first.id)

  Department.create(name:"Judicial", description: "Judicial", branch_id: Branch.where(city_id: City.where(name:"Villahermosa").first.id).first.id)
  Department.create(name:"Extrajudicial", description: "Extrajudicial", branch_id: Branch.where(city_id: City.where(name:"Villahermosa").first.id).first.id)
  Department.create(name:"Proceso Judicial Masivo", description: "Proceso Judicial Masivo", branch_id: Branch.where(city_id: City.where(name:"Villahermosa").first.id).first.id)

  Department.create(name:"Judicial", description: "Judicial", branch_id: Branch.where(city_id: City.where(name:"Mérida").first.id).first.id)
  Department.create(name:"Extrajudicial", description: "Extrajudicial", branch_id: Branch.where(city_id: City.where(name:"Mérida").first.id).first.id)
  Department.create(name:"Proceso Judicial Masivo", description: "Proceso Judicial Masivo", branch_id: Branch.where(city_id: City.where(name:"Mérida").first.id).first.id)

end








