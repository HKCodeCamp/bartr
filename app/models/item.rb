class Item < ActiveRecord::Base
  attr_accessible :title, :desc, :price
  attr_accessible :category, :deleted_at, :owner_id, :status, :tag

  validates :title, :length => { :minimum => 2, :maximum => 50 }
  validates :desc, :length => { :minimum => 5, :maximum => 3000 }
  validates :price, :numericality => { :only_integer => true, :greater_than => 1.0 }

  has_attachments :photos, maximum: 10

  def to_s
    "<Item title=#{title}, price=#{price % ["%.0f"]}>"
  end
end
