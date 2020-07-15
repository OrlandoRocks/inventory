puts '==> Filling the \'User to Tormenz BRANCH\' table...'

# Deletes all existing records.
#Category.delete_all

# Restarts ids to 1.
#ActiveRecord::Base.connection.reset_pk_sequence!('categories')

# Content.


# BC - Tijuana
User.create(first_name: "Susana", last_name: "Del Angel", maiden_name: "" ,email:"sdelangel@grupotormenz.com ", password: 'password', password_confirmation:'password',role_id:  Role.where(key: "admin_sucursal").first.id)
# Sonora - Nogales
User.create(first_name: "Consuelo", last_name: "Espinoza", maiden_name: "" ,email:"cespinoza@grupotormenz.com", password: 'password', password_confirmation:'password',role_id:  Role.where(key: "admin_sucursal").first.id)
# Sonora - Hermosillo
User.create(first_name: "Jannette", last_name: "Varela", maiden_name: "Munguia" ,email:"jvarela@grupotormenz.com", password: 'password', password_confirmation:'password',role_id:  Role.where(key: "admin_sucursal").first.id)
# Chihuahua - Juarez
User.create(first_name: "Luz", last_name: "Centeno", maiden_name: "" ,email:"lcenteno@grupotormenz.com ", password: 'password', password_confirmation:'password',role_id:  Role.where(key: "admin_sucursal").first.id)
# Chihuahua - Juarez
User.create(first_name: "Felipe", last_name: "Alcantar", maiden_name: "" ,email:"falcantar@grupotormenz.com ", password: 'password', password_confirmation:'password',role_id:  Role.where(key: "admin_sucursal").first.id)
# Chihuahua - Chihuahua
User.create(first_name: "Daniel", last_name: "Heredia", maiden_name: "" ,email:"dheredia@grupotormenz.com ", password: 'password', password_confirmation:'password',role_id:  Role.where(key: "admin_sucursal").first.id)

# >>>>>>> FALTA Chihuahua - CORREDOR SUR...

# Durango - Durango
User.create(first_name: "Francia", last_name: "Rendon", maiden_name: "" ,email:"frendendon@grupotormenz.com ", password: 'password', password_confirmation:'password',role_id:  Role.where(key: "admin_sucursal").first.id)
# Durango - Gomez Palacio
User.create(first_name: "Ilse", last_name: "Lara", maiden_name: "" ,email:"ilara@grupotormenz.com ", password: 'password', password_confirmation:'password',role_id:  Role.where(key: "admin_sucursal").first.id)
# Coahuila - Torreón
User.create(first_name: "Erika", last_name: "Lafont", maiden_name: "" ,email:"elafont@grupotormenz.com", password: 'password', password_confirmation:'password',role_id:  Role.where(key: "admin_sucursal").first.id)
# Coahuila- Saltillo
User.create(first_name: "Mariana", last_name: "Rosales", maiden_name: "" ,email:"mrosales@grupotormenz.com", password: 'password', password_confirmation:'password',role_id:  Role.where(key: "admin_sucursal").first.id)
# Nuevo León - Monterrey
User.create(first_name: "Karla", last_name: "Ayala", maiden_name: "Garfio" ,email:"kayala@grupotormenz.com", password: 'password', password_confirmation:'password',role_id:  Role.where(key: "admin_sucursal").first.id)
# Tamaulipas - Reynosa
User.create(first_name: "Pilar", last_name: "Cruz", maiden_name: "Reyes" ,email:"pcruz@grupotormenz.com", password: 'password', password_confirmation:'password',role_id:  Role.where(key: "admin_sucursal").first.id)

# >>>>>>> FALTA GUADALAJARA JALISCO - CORREDOR SUR...


# Querétaro - Querétaro
User.create(first_name: "Rodolfo", last_name: "Barrientos", maiden_name: "" ,email:"rbarrientos@grupotormenz.com", password: 'password', password_confirmation:'password',role_id:  Role.where(key: "admin_sucursal").first.id)
# San Luis Potosí-San Luis Potosí
User.create(first_name: "Miguel Angel", last_name: "Lara", maiden_name: "" ,email:"mlara@grupotormenz.com", password: 'password', password_confirmation:'password',role_id:  Role.where(key: "admin_sucursal").first.id)

# >>>>>>> FALTA CIUDAD DE MEXICO >>>>>>>>>>

# Guerrero - Acápulco
User.create(first_name: "Erika", last_name: "Gallardo", maiden_name: "" ,email:"egallardo@grupotormenz.com", password: 'password', password_confirmation:'password',role_id:  Role.where(key: "admin_sucursal").first.id)
# Tabasco-Villahermosa
User.create(first_name: "Emmanuel", last_name: "Bautista", maiden_name: "" ,email:"ebautista@grupotormenz.com", password: 'password', password_confirmation:'password',role_id:  Role.where(key: "admin_sucursal").first.id)
# Yucatán - Mérida
User.create(first_name: "Paola", last_name: "Rojas", maiden_name: "" ,email:"projas@grupotormenz.com", password: 'password', password_confirmation:'password',role_id:  Role.where(key: "admin_sucursal").first.id)







