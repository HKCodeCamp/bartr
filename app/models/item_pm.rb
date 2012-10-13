class ItemPm < ActiveRecord::Base
  belongs_to :item
  belongs_to :sender, :class_name => "User"
  attr_accessible :message

  validates_presence_of :item_id, :sender_id, :message
end
