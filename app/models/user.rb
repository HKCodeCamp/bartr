class User < ActiveRecord::Base
  attr_accessible :mobile_no
  include User::SmsVerifiable
  include User::Adminable
  
  devise :confirmable, :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :deleted_at, :desc, :name, :status, :tag

  has_and_belongs_to_many :roles
  has_many :followings, :class_name => "Follower", :foreign_key => "following_id", :dependent => :destroy
  has_many :followers, :foreign_key => "followed_by_id", :dependent => :destroy
  has_many :followed_bies, :through => :followings
  has_many :items, :foreign_key => 'owner_id'
  has_many :comments, :dependent => :destroy
  has_many :interests, :dependent => :destroy

  scope :active_sellers, scoped

  def role?(role)
    return !!self.roles.find_by_name(role.to_s)
  end

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['info']
    if user = User.find_by_email(data["email"])
      user
    else # Create a user with a stub password.
      User.create!(:email => data["email"], :password => Devise.friendly_token[0,20])
    end
  end

  def is_following?(user)
    user.followed_bies.include? self
  end

  def is_interested_in?(item)
    interests.map(&:item_id).include?(item.id)
  end

end
