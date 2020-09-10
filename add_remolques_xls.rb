

p 'Hola bebe'

require 'roo'

xlsx = Roo::Spreadsheet.open('./Inventario sucursal Irapuato.xlsx')
xlsx = Roo::Excelx.new("./Inventario sucursal Irapuato.xlsx")

# Use the extension option if the extension is ambiguous.
# xlsx = Roo::Spreadsheet.open('./rails_temp_upload', extension: :xlsx)

# p xlsx.info
# => Returns basic info about the spreadsheet file
#

xlsx.sheets.each do |sheet_name|
  puts ''
  puts sheet_name
  puts '--------------'
  sheet = xlsx.sheet(sheet_name)

  if !sheet.nil?
    last_row    = sheet.last_row
    last_column = sheet.last_column

    if !last_row.nil? and !last_column.nil?
      for row in 2..last_row

        create_item_string = "Item.create(remission: '"+ sheet.cell(row, 1).to_s + "', model:'"+ sheet.cell(row, 3).to_s + "', serial_number:'"+ sheet.cell(row, 4).to_s +
            "', code:'"+ sheet.cell(row, 7).to_s.split(' ')[0] + "', purchased_date:'"+ sheet.cell(row, 7).to_s.split(' ')[1] + "', accessory:'"+ sheet.cell(row, 8).to_s +
            "',department_id:1, status_item_id:1, sub_category_id: 1, branch_id: 1, name:'Remolque "+row.to_s+"', description:'Remolque "+row.to_s+"') "

        p create_item_string


        Item.create(remission: "'"+ sheet.cell(row, 1).to_s + "'", model:"'"+ sheet.cell(row, 3).to_s + "'", serial_number:"'"+ sheet.cell(row, 4).to_s +
            "'", code:"'"+ sheet.cell(row, 7).to_s.split(' ')[0] + "'", purchased_date:"'"+ sheet.cell(row, 7).to_s.split(' ')[1] + "'", accessory:"'"+ sheet.cell(row, 8).to_s +
            "'",department_id:1, status_item_id:1, sub_category_id: 1, branch_id: 1, name:"'Remolque "+row.to_s+"'", description:"'Remolque "+row.to_s+"'")


        # for col in 1..last_column
        #   v = sheet.cell(row, col)
        #
        #
        #
        #   # if v.nil?
        #   #   puts "NIL"
        #   # else
        #   #   puts "["+row.to_s+","+col.to_s+"]: " + sheet.cell(row, col).to_s
        #   # end
        # end
      end
    else
      puts 'Seems no data in sheet: ' + sheet_name
    end
  end


end