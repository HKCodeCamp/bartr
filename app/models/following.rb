class Following < ActiveRecord::Base
  belongs_to :follower, :class_name => "User", :counter_cache => :followers_count
  belongs_to :following, :class_name => "User"

  attr_accessible :follower_id

  validates_presence_of :follower_id, :following_id
  validates_uniqueness_of :follower_id, :scope => :following_id
  validate do
    errors.add(:follower_id, :invalid) if follower_id == following_id
  end
end
