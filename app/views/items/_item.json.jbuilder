json.(item, :id, :title, :desc, :price, :address, :latitude, :longitude)

if has_coord?
  json.distance distance_from_user(item)
end

json.photos item.photos do |json, photo|
  json.thumb photo.fullpath(:width => 80, :height => 80, :crop => :thumb, angle: :exif)
  json.small photo.fullpath(:width => 300, :height => 300, :crop => :thumb, angle: :exif)
  json.medium photo.fullpath(:width => 600, :height => 600, :crop => :thumb, angle: :exif)
  json.large photo.fullpath(:width => 1200, :height => 1200, :crop => :fit, angle: :exif)
end