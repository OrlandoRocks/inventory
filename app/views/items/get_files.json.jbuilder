require "pathname"
json.array!(@item_files) do |item|
  pn = item.file.url.nil? ? "" : Pathname.new(item.file.url)
  json.extract! item, :id, :item_id, :file, :description, :created_at
  json.file_name File.basename(pn)
  json.file_type Item.file_types.key(item.file_type)
  json.url item_url(item, format: :json)
end



