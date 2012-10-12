class Item < ActiveRecord::Base
  attr_accessible :title, :desc, :price
  attr_accessible :category, :deleted_at, :owner_id, :status, :tag
end
