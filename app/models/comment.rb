class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  attr_accessible :comment

  validates_presence_of :user_id, :item_id, :comment
end
