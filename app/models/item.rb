class Item < ActiveRecord::Base
  attr_accessible :title, :desc, :price
  attr_accessible :category, :deleted_at, :owner_id, :status, :tag

  attr_accessible :address, :latitude, :longitude
  reverse_geocoded_by :latitude, :longitude

  belongs_to :owner, :class_name => 'User'

  validates :title, :length => { :minimum => 2, :maximum => 50 }
  validates :desc, :length => { :minimum => 5, :maximum => 3000 }
  validates :price, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0.0 }
  validates :owner, :presence => true

  def to_s
    "<Item title=#{title}, price=#{price % ["%.0f"]}>"
  end
end
