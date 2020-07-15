require 'csv'


csv_text = File.open(Rails.root.join('lib', 'seeds', 'final_tormenz.csv'), "r:ISO-8859-1")
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

  id_company = Company.where(name:"Grupo Tormenz").first.nil? ? Company.create(name: "Grupo Tormenz", description: "Grupo Tormenz").id : Company.where(name:"Grupo Tormenz").first.id


      p 'COMPANY ID!'
      p id_company


  csv.each do |row|
    if row["ROL"]=="DIRECTOR"
      id_role = Role.find_by_key("admin_empresa").id

      p 'ROLE ID!'
      p id_role

      User.create(email: row["CORREOS"].empty? ? "#{row["NO. DE EMPLEADO"]}@grupotormenz.com" : row["CORREOS"], password: 'grupotormenz', password_confirmation: 'grupotormenz', role_id: id_role, first_name: row["NOMBRE"], last_name: row["APELLIDO PATERNO"], maiden_name: row["APELLIDO MATERNO"], employee_number: row["NO. DE EMPLEADO"], current_company: id_company )

      id_user = User.last.id

      p 'USER ID!'
      p id_user


      Company.find(id_company).update(user_id: id_user)
    end
  end


csv.each do |row|
  if row["ROL"]=="GERENTE"
    id_role = Role.find_by_key("admin_sucursal").id
    p 'ROLE ID!'
    p id_role
    id_branch = Branch.where(name:row["NOMBRE DE LA GERENCIA"]).first.nil? ?
                    Branch.create(name: row["NOMBRE DE LA GERENCIA"], description: row["NOMBRE DE LA GERENCIA"], company_id: id_company, code: row["CODIGO DE UBICACION DE LA GERENCIA"]).id :
                    Branch.where(name:row["NOMBRE DE LA GERENCIA"]).first.id
    p 'BRANCH ID!'
    p id_branch
    id_user = User.create(email: row["CORREOS"].empty? ? "#{row["NO. DE EMPLEADO"]}@grupotormenz.com" : row["CORREOS"], password: 'grupotormenz', password_confirmation: 'grupotormenz', role_id: id_role, first_name: row["NOMBRE"], last_name: row["APELLIDO PATERNO"], maiden_name: row["APELLIDO MATERNO"], employee_number: row["NO. DE EMPLEADO"], current_company: id_company )
    p 'USER ID!'
    p id_user.id

    Branch.find(id_branch).update(manager_id:id_user.id)
  end
  #puts "#{row["NO. DE EMPLEADO"]}"
end



csv.each do |row|


  if row["ROL"]=="COORDINADOR"
    id_role = Role.find_by_key("admin_departamento").id

    id_branch = Branch.where(name:row["NOMBRE DE LA GERENCIA"]).first.id

    department_name = "#{row['DEPARTAMENTO']} (#{row['SUCURSAL']})"
    department_code = "#{row['CODIGO DE SUCURSAL']}"#-#{row['CODIGO DE DEPARTAMENTO']}"

    id_user = User.create(email: row["CORREOS"].empty? ? "#{row["NO. DE EMPLEADO"]}@grupotormenz.com" : row["CORREOS"], password: 'grupotormenz', password_confirmation: 'grupotormenz', role_id: id_role, first_name: row["NOMBRE"], last_name: row["APELLIDO PATERNO"], maiden_name: row["APELLIDO MATERNO"], employee_number: row["NO. DE EMPLEADO"], current_company: id_company )



    department = Department.where(name:department_name).first.nil? ? Department.create(name: department_name, description: department_name, branch_id: id_branch, code: department_code, sequence:1 ) : Department.where(name:department_name).first


    department.update(manager_id: id_user.id)

    p 'DEPARMENT!!!!!!!!!!!!!!!!!!'
    p id_branch
    p id_user
    p department



  end



end



csv.each do |row|


  p 'ROLE ID!'
  p row

  if row["ROL"]=="EMPLEADO"
    id_role = Role.find_by_key("empleado_sin_acceso").id

    p 'ROLE ID!'
    p id_role

    nombre_jefe_inmediato = row["JEFE INMEDIATO"].split


    p 'nombre jefe!!'
    p nombre_jefe_inmediato

    jefe_inmediato = User.where(last_name: nombre_jefe_inmediato[0].capitalize, maiden_name: nombre_jefe_inmediato[1].capitalize).first

    p 'Jefe Inmediato!!'
    p jefe_inmediato


    employee_department = jefe_inmediato.nil? ? nil : Department.where(manager_id: jefe_inmediato.id)


    p 'Jefe Inmediato!!'
    p employee_department

    unless employee_department.nil?

      p 'Empleado sin acceso'
      p employee_department.first.id
      id_company = 25

      p 'NO. DE EMPLEADO'
      p row

      user = User.create(email: "#{row["NO. DE EMPLEADO"]}@grupotormenz.com",
                  password: 'grupotormenz',
                  password_confirmation: 'grupotormenz',
                  role_id: id_role,
                  first_name: row["NOMBRE"],
                  last_name: row["APELLIDO PATERNO"],
                  maiden_name: row["APELLIDO MATERNO"],
                  employee_number: row["NO. DE EMPLEADO"],
                  current_company: id_company,
                  department_id: employee_department.first.id ) unless employee_department.first.nil?

      p 'Usuario ID'
      p user.id

    end

  end



end

# puts "csv_text"
# puts csv


