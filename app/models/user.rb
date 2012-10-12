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
  has_many :followings, :foreign_key => "following_id", :dependent => :destroy
  has_many :followers, :through => :followings

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
    followers.include? user
  end

end
