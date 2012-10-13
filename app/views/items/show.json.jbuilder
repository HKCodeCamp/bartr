json.(@item, :id, :title, :desc, :price, :address, :latitude, :longitude)
json.photos @item.photos do |json, photo|
  json.partial! photo
end