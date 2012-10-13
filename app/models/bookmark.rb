class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  attr_accessible :user_id

  validates_presence_of :user_id, :item_id
  validates_uniqueness_of :user_id, :scope => :item_id
end
