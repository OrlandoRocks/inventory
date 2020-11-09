
require 'fiddle'
require 'rjb'
require 'net/http'
require 'json'

classpath = '.'

Dir["lib/jasper-6.7.0/*.jar"].each do |jar|
  classpath << File::PATH_SEPARATOR + File.expand_path(jar)
end


p "------------------------------------------------------------------------"
p classpath
# Rjb::load 'net.sf.jasperreports.engine.JasperCompileManager'
Rjb::load( classpath, ['-Djava.awt.headless=true','-Xms128M', '-Xmx256M'] )
p "ENTRE --------------------------------"
Rjb::load 'net.sf.jasperreports.engine.export.JRXlsExporter'
Rjb::load 'net.sf.jasperreports.engine.export.JRXlsExporterParameter'
Rjb::load 'net.sf.jasperreports.engine.util.JRStyledTextParser'
Rjb::load 'net.sf.jasperreports.engine.JRRenderable'
Rjb::load 'net.sf.jasperreports.extensions.ExtensionsEnvironment'
Rjb::load 'java.awt.Color'

JasperCompileManager    = Rjb::import 'net.sf.jasperreports.engine.JasperCompileManager'
JsonDataSource          = Rjb::import 'net.sf.jasperreports.engine.data.JsonDataSource'
JREmptyDataSource       = Rjb::import 'net.sf.jasperreports.engine.JREmptyDataSource'
JasperFillManager       = Rjb::import 'net.sf.jasperreports.engine.JasperFillManager'
JasperExportManager     = Rjb::import 'net.sf.jasperreports.engine.JasperExportManager'
ImageIO                 = Rjb::import 'javax.imageio.ImageIO'
HashMap                 = Rjb::import 'java.util.HashMap'
FileInputStream         = Rjb::import 'java.io.FileInputStream'
ByteArrayOutputStream   = Rjb::import 'java.io.ByteArrayOutputStream'
ByteArrayInputStream    = Rjb::import 'java.io.ByteArrayInputStream'

class ReportsController < ApplicationController


  def report_sales

    titulo_reporte = 'Trailers Vendidos'
    nombre_reporte = 'trailers_vendidos'

    @trailers_sold = Item.where(status_item_id: [StatusItem.find_by_key('vendido').id, StatusItem.find_by_key('pendiente_factura').id, StatusItem.find_by_key('facturado').id])

    lista_datos = Array.new

    e = Hash.new

    # e['nombre'] = @resumen_declaracion.nombre_pila + ' ' + @resumen_declaracion.apellido_paterno + ' ' + @resumen_declaracion.apellido_materno

    lista_datos.append e

    #Variables para pasar por parametro al reporte
    time = Time.current
    parametros = HashMap.new
    parametros.put("USUARIO", "Alejandro Rodriguez")
    parametros.put("FECHA", Time.now.to_formatted_s(:db))
    parametros.put("TITULO_REPORTE", titulo_reporte)


    parametros.put("FECHA_ENCABEZADO", "")

    #Se imprime el reporte
    genera_reporte(parametros, nombre_reporte, lista_datos)


  end

  def genera_reporte(parametros, nombre_reporte, lista_valores)

    jasper_report = FileInputStream.new("public/#{nombre_reporte}.jasper")

    data = lista_valores.to_json

    file = ByteArrayInputStream.new(data)
    ds = JsonDataSource.new(file)
    output = ByteArrayOutputStream.new

    jasper_print = JasperFillManager.fill_report(jasper_report, parametros, ds)
    JasperExportManager.exportReportToPdfStream jasper_print, output

    send_data output.toByteArray,
              filename: "reporte_#{nombre_reporte}.pdf",
              type: 'application/pdf'

  end

end
