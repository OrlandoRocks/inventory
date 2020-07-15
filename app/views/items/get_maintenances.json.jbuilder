require "pathname"
json.array!(@item_maintenances) do |item|
  pn = item.file.url.nil? ? "" : Pathname.new(item.file.url)
  json.extract! item, :id, :item_id, :file, :maintenance_id, :description, :price
  json.file_name File.basename(pn)
  json.maintenance item.try('maintenance').try('name')
  json.provider Provider.find(item.provider).name
  json.url item_url(item, format: :json)
end


