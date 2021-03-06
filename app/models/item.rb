class Item < ActiveRecord::Base
  attr_accessible :title, :desc, :price
  attr_accessible :category, :deleted_at, :owner_id, :status, :tag

  attr_accessible :address, :latitude, :longitude
  reverse_geocoded_by :latitude, :longitude

  belongs_to :owner, :class_name => 'User'
  belongs_to :buyer, :class_name => 'User'
  has_many :comments, :dependent => :destroy
  has_many :interests, :dependent => :destroy
  has_many :bookmarks, :dependent => :destroy
  has_many :item_pms, :foreign_key => 'sender_id'

  validates :title, :length => { :minimum => 2, :maximum => 50 }
  validates :desc, :length => { :minimum => 5, :maximum => 3000 }
  validates :price, :numericality => { :greater_than_or_equal_to => 0.0 }
  validates :owner, :presence => true

  has_attachments :photos, maximum: 10

  def to_s
    "<Item title=#{title}, price=#{price % ["%.0f"]}>"
  end
end
