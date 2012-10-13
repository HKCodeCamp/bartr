json.(item, :id, :title, :desc, :price, :address, :latitude, :longitude)

json.photos item.photos do |json, photo|
  json.thumb photo.fullpath(:width => 80, :height => 80, :crop => :thumb)
  json.small photo.fullpath(:width => 300, :height => 300, :crop => :thumb)
  json.medium photo.fullpath(:width => 600, :height => 600, :crop => :thumb)
  json.large photo.fullpath(:width => 1200, :height => 1200, :crop => :fit)
end