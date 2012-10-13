class Interest < ActiveRecord::Base

  after_create :email_owner  # for user interested a item
  after_update :email_status_change, :if => :status_changed? # when seller change the status


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

  def email_status_change
    if (status == STATUS_RESERVED)
      mail = ItemMailer.delay.reserved(item, user)  
    elsif(status == STATUS_SOLD)
      mail = ItemMailer.delay.reserved(item, user)  
    end  
  end

  def email_owner
    mail = ItemMailer.delay.interested(item, user)  
  end

end