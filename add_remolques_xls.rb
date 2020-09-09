

p 'Hola bebe'

require 'roo'

xlsx = Roo::Spreadsheet.open('./Inventario sucursal Irapuato.xlsx')
xlsx = Roo::Excelx.new("./Inventario sucursal Irapuato.xlsx")

# Use the extension option if the extension is ambiguous.
# xlsx = Roo::Spreadsheet.open('./rails_temp_upload', extension: :xlsx)

p xlsx.info
# => Returns basic info about the spreadsheet file