class ItemPm < ActiveRecord::Base
  belongs_to :item
  belongs_to :sender, :class_name => "User", :foreign_key => "sender_id"
  attr_accessible :message

  validates_presence_of :item_id, :sender_id, :message

  after_create do
    mail = ItemMailer.delay.item_pm(self)
  end

end
