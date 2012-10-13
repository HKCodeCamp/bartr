json.(@item, :id, :title, :desc, :price, :address, :latitude, :longitude)

json.photos @item.photos do |json, photo|
  json.thumb photo.fullpath(:width => 80, :height => 80, :crop => :thumb)
  json.small photo.fullpath(:width => 300, :height => 300, :crop => :thumb)
  json.medium photo.fullpath(:width => 600, :height => 600, :crop => :thumb)
  json.large photo.fullpath(:width => 1200, :height => 1200, :crop => :fit)
end

json.comments @item.comments do |json, comment|
  json.partial! "items/comment", comment: comment
end

json.interests @item.interests do |json, interest|
  json.id interest.id
  json.user do
    json.id interest.user.id
    json.name interest.user.name
    json.email interest.user.email
  end
end