

require 'fiddle'
require 'rjb'


classpath = '.'


Dir["/home/deployer/inventory/lib/jasper/*.jar"].each do |jar|
  classpath << File::PATH_SEPARATOR + File.expand_path(jar)
end


  # =begin
  #   JARS = Dir.glob("#{Rails.root}/lib/jasper/ant-1.7.1.jar").join(':')
  #
  #
  #   Rjb::add_jar( Dir.glob("#{Rails.root}/lib/jasper/*.jar").join(':'))
  #
  #
  #   Dir.glob("#{Rails.root}/lib/jasper/*.jar").each do |jar|
  #     classpath << File::PATH_SEPARATOR + File.expand_path(jar)
  #   end
  #
  #
  #   Rjb::load(Dir.glob("#{Rails.root}/lib/jasper/*.jar").join(':'))
  # =end



Rjb::load( classpath, ['-Djava.awt.headless=true','-Xms128M', '-Xmx256M'] )


#JasperCompileManager = Rjb::import'net.sf.jasperreports.engine.JasperCompileManager'
JsonDataSource = Rjb::import 'net.sf.jasperreports.engine.data.JsonDataSource'
JasperFillManager = Rjb::import 'net.sf.jasperreports.engine.JasperFillManager'
Rjb::load('net.sf.jasperreports.engine.export.JRXlsExporter')
Rjb::load('net.sf.jasperreports.engine.export.JRXlsExporterParameter')
JasperExportManager = Rjb::import 'net.sf.jasperreports.engine.JasperExportManager'
Rjb::load('net.sf.jasperreports.engine.JRRenderable')
Rjb::load('net.sf.jasperreports.extensions.ExtensionsEnvironment')
HashMap =  Rjb::import 'java.util.HashMap'
FileInputStream =  Rjb::import 'java.io.FileInputStream'
ImageIO = Rjb::import('javax.imageio.ImageIO')
ByteArrayOutputStream  = Rjb::import 'java.io.ByteArrayOutputStream'
ByteArrayInputStream  = Rjb::import 'java.io.ByteArrayInputStream'
Rjb::load('java.awt.Color')
#Java = Rjb::import('java')



class ReportsController < ApplicationController



    def report_rol
      titulo_reporte = params[:titulo_reporte]
      nombre_reporte = params[:nombre_reporte]
      @users = User.all
      lista_datos = Array.new
      @users.each do |datos|
        e = Hash.new
        e['nombre'] = '' #datos.nombre+' '+datos.apellido_paterno+' '+datos.apellido_materno
        e['email'] = ''#datos.email
        e['direccion'] = ''#datos.direccion
        e['telefono'] = ''#datos.telefono
        e['celular'] = ''#datos.celular
        e['numero'] = '2'
        lista_datos.append e
      end
      #Variables para pasar por parametro al reporte
      time = Time.current
      parametros = HashMap.new
      parametros.put("USUARIO", current_user.full_name)
      parametros.put("FECHA", time.strftime("%d-%m-%Y %H:%M %p"))
      parametros.put("TITULO_REPORTE", titulo_reporte)

      #Se imprime el reporte
      genera_reporte(parametros, nombre_reporte, lista_datos)
    end


    def report_check_items_user
      titulo_reporte = params[:titulo_reporte]
      nombre_reporte = params[:nombre_reporte]
      #@items = Item.joins(:user).where(user_id: params[:user_id])

      #@items = Item.items_assigned.where(user_id: params[:user_id], departments:{manager_id: params[:user_id]}  )

      #@items = Item.items_assigned.all

      #@items = policy_scope(Item)

      #@all_items = nil
      # Consultamos si es empleado_sin_acceso para solo buscar sus items.

      #if User.where("id = ? And role_id = ?",params[:user_id], 7).present?

      user = User.find(params[:user_id])

      if user.present?
        @all_items = Item.items_assigned.where(user_id: params[:user_id])
      else
        if Branch.where(manager_id: params[:user_id]).first.present?
          @all_items = Item.items_assigned.where(branch_id: Branch.where(manager_id: params[:user_id]).first.id)
        end
      end

=begin
      branch_id = Branch.where(manager_id: params[:user_id]).present?? Branch.where(manager_id: params[:user_id]).first.id : 0
      unless branch_id = 0
        @all_items = Item.items_assigned.where(branch_id: branch_id)
        @my_items = Item.items_assigned.where(user_id: params[:user_id])
      else
        @my_items = Item.items_assigned.where(user_id: params[:user_id])
      end
=end

      #@avatar = User.where(id: params[:user_id]).first.avatar.small.url
      #image =  @avatar.present? ? FileInputStream.new( "public/"+@avatar) : FileInputStream.new('/app/assets/images/avatar_male.png')




      value = true
      lista_datos = Array.new
      @all_items.each do |item|
        e = Hash.new
        e['item_name'] = item.name.present? ? item.name : "N/A"
        e['item_code'] = item.code.present? ? item.code : "N/A"
        e['employee_number'] = user.employee_number.nil? ? "" : user.employee_number
        e['employee'] = user.present? ? user.full_name.upcase : ""
        e['employee_full'] = user.present? ? user.full_name.upcase : ""
        e['department']  = "#{search_company_user(user)} / #{ search_branch_user  (user)}"
        e['department_branch_company'] = "#{ search_department_user(user)  }"
        e['boss'] ="#{direct_boss (user) }"
        e['current_user'] = "#{ current_user.try(:employee_number)}-#{current_user.try(:full_name)}"
        # if item.department.present? && value
        #   e['employee_number'] = user.employee_number.nil? ? "" : user.employee_number.upcase
        #   e['employee'] = user.present? ? user.full_name.upcase : ""
        #   e['employee_full'] =  user.present? ? user.full_name.upcase : "" #"#{user.employee_number} - #{ user.full_name}"
        #   e['department'] =   user.department.present? ? user.department.name : ""
        #   e['department_branch'] =   user.department.present? ?  user.department.branch.name : ""
        #   e['department_branch_company'] =   user.department.present? ? user.department.branch.name : ""
        #   e['total_items'] =   @all_items.count
        #   value = false
        # elsif value
        #   e['employee_number'] = user.employee_number.nil? ? "" : user.employee_number
        #   e['employee'] = user.present? ? user.full_name.upcase : ""
        #   e['employee_full'] = user.present? ? user.full_name.upcase : ""
        #   e['department']  = "#{search_company_user(user)} / #{search_branch_user(user)}"
        #   e['department_branch_company'] = "#{search_department_user(user) }"
        #   e['total_items'] =   @all_items.count
        #   value = false
        # end
        e['category'] = "#{item.try(:category).try(:name) } / #{item.try(:sub_category).try(:name)}"
        e['date_assign'] = I18n.localize item.updated_at, format: :custom #item.updated_at.to_formatted_s(:db)
        e['item_status'] =  item.status_item.present?? item.status_item.name : ""

        lista_datos.append e
      end

      #Variables para pasar por parametro al reporte
      time = Time.current
      parametros = HashMap.new
      parametros.put("USUARIO", current_user.full_name)
      parametros.put("FECHA", time.strftime("%d-%m-%Y %H:%M %p").try(:upcase))
      parametros.put("TITULO_REPORTE", titulo_reporte)
      #parametros.put("FOTO", image)

        #Se imprime el reporte
      genera_reporte(parametros, nombre_reporte, lista_datos)

    end


    def report_item
      titulo_reporte = params[:titulo_reporte]
      nombre_reporte = params[:nombre_reporte]
      id = params[:id]
      @item = Item.where(id: id)

      lista_datos = Array.new
      @item.each do |datos|
        e = Hash.new
        e['name'] = datos.name
        e['description'] = datos.name
        e['model'] = datos.model
        e['serial_number'] = datos.serial_number
        e['purchased_date'] = datos.purchased_date
        e['in_service_date'] = datos.in_service_date
        e['time_unit_service'] = datos.time_unit_service
        e['time_quantity_service'] = datos.time_quantity_service
        e['price'] = datos.price
        e['time_unit_depreciation'] = datos.time_unit_depreciation
        e['time_quantity_depreciation'] = datos.time_quantity_depreciation
        e['sub_category'] = datos.sub_category_id
        e['provider_id'] = datos.provider
        e['department_id'] = datos.department_id
        e['user_id'] = datos.user_id
        e['brand_id'] = datos.brand_id
        e['status_item_id'] = datos.status_item_id
        lista_datos.append e
      end
      #Variables para pasar por parametro al reporte
      time = Time.current
      parametros = HashMap.new
      parametros.put("USUARIO", current_user.email)
      parametros.put("FECHA", time.strftime("%d-%m-%Y %H:%M %p"))
      parametros.put("TITULO_REPORTE", titulo_reporte)

      #Se imprime el reporte
      genera_reporte(parametros, nombre_reporte, lista_datos)
    end





    #Metodo que se encarga de construir reporte pdf o excel
    def genera_reporte(parametros, nombre_reporte, lista_valores)



      #if lista_valores.empty?
        # message = 'El reporte no tiene datos que mostrar!!'
        # respond_to do |format|
        #   format.js { render js: "alert(#{message});" }
        # end
        #redirect_to user_registrations_path
      #else

        #data = lista_valores.to_json.to_java.getBytes("UTF-8")
        data = lista_valores.to_json
        file = ByteArrayInputStream.new(data)
        ds = JsonDataSource.new(file)
        output = ByteArrayOutputStream.new()


#jasperReport = FileInputStream.new("public/#{lista_valores}.jasper")

        respond_to do |format|
          format.pdf {

 #           begin

              jasperReport = FileInputStream.new("/home/deployer/inventory/public/#{nombre_reporte}.jasper")

              jasperPrint = JasperFillManager.fill_report(jasperReport, parametros, ds)

              p '//gkgkgkgkgkgk///////////////////////'
              p jasperPrint
              JasperExportManager.exportReportToPdfStream(jasperPrint, output)




              send_data output.toByteArray(),
                        filename: "#{nombre_reporte}.pdf",
                        type: 'application/pdf'



  #          rescue

   #           puts "Error #{$!}"
   #         end
          }
        end
      #end

    end

    def god?
      role and role.key == 'god'
    end

    def admin?
      role and role.key == 'admin'
    end

    def admin_company?
      role and role.key == 'admin_empresa'
    end

    def admin_branch?
      role and role.key == 'admin_sucursal'
    end

    def admin_department?
      role and role.key == 'admin_departamento'
    end

    def user_employee?
      role and %w(empleado empleado_sin_acceso).include? role.key
    end


    def direct_boss user
      if user.god? or user.admin?
        ''
      elsif user.admin_company?
        id = Role.where(key: %w( admin)).first.id
        User.find_by_role_id(id).try(:full_name).try(:upcase)
      elsif user.admin_branch?
        Branch.where(manager_id: user.id).try(:first).try(:company).try(:user).try(:full_name).try(:upcase)
      elsif user.admin_department?
        Department.where(manager_id: user.id).try(:first).try(:branch).try(:user).try(:full_name).try(:upcase)
      elsif user.employee?
        User.find(user.id).try(:department).try(:manager).try(:full_name).try(:upcase)
      end
    end

    def search_company_user user
      if user.try(:companies).present?
        Company.where(user_id: user.id).first.try(:name)
      elsif user.try(:company).present?
        user.try(:company).try(:name).try(:upcase)
      elsif user.role.key.eql? ('admin_sucursal')
        user.try(:branches).try(:first).try(:company).try(:name).try(:upcase)
      end

    end

    def search_branch_user user
      if user.role.key.eql? ('empleado_sin_acceso') or  user.role.key.eql? ('admin_departamento')
        user.try(:department).try(:branch).try(:name).try(:upcase)
      elsif user.role.key.eql? ('admin_sucursal')
        user.try(:branches).try(:first).try(:name).try(:upcase)
      end
    end

    def search_department_user user
      if user.try(:departments).present?
        user.departments.last.name.try(:upcase)
      elsif user.try(:department).present?
        user.department.name.try(:upcase)
      end
    end

end
