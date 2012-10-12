class Follower < ActiveRecord::Base
  belongs_to :followed_by, :class_name => "User"
  belongs_to :following, :class_name => "User", :counter_cache => :followers_count

  attr_accessible :followed_by_id

  validates_presence_of :followed_by_id, :following_id
  validates_uniqueness_of :followed_by_id, :scope => :following_id
  validate do
    errors.add(:followed_by_id, :invalid) if followed_by_id == following_id
  end
end
