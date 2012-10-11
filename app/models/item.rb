class Item < ActiveRecord::Base
  attr_accessible :category, :deleted_at, :desc, :owner_id, :price, :status, :tag, :title
end
