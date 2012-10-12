json.(item, :id, :title, :desc, :price, :address, :latitude, :longitude)
json.thumbnails item.photos do |json, photo|
  json.image_url do |json|
    json.url photo.fullpath(:width => 300, :height => 300, :crop => :thumb)
  end
end