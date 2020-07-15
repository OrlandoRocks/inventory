require 'csv'

p '/////////////////////////////////////////////'

csv_text = File.open(Rails.root.join('lib', 'seeds', 'tormenz.csv'), "r:ISO-8859-1")
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
#
csv.each do |row|
  puts "#{row["codSucursal"]}-#{row["codDepto"]}-#{row["Serial"]}"
end

# puts "csv_text"
# puts csv


