class Interest < ActiveRecord::Base
  STATUS_DEFAULT = 0
  STATUS_RESERVED = 1
  STATUS_SOLD = 2

  STATUSES = { STATUS_DEFAULT => :default,
               STATUS_RESERVED => :reserved,
               STATUS_SOLD => :sold
             }.freeze

  belongs_to :user
  belongs_to :item
  attr_accessible :status, :user_id

  validates_presence_of :user_id, :item_id
  validates_uniqueness_of :user_id, :scope => :item_id
  validates_inclusion_of :status, :in => STATUSES.keys


end
