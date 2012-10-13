json.(@item, :id, :title, :desc, :price, :address, :latitude, :longitude)
json.photos @item.photos do |json, photo|
  json.partial! "items/photo", photo: photo
end
json.comments @item.comments do |json, comment|
  json.partial! "items/comment", comment: comment
end
