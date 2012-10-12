class Role < ActiveRecord::Base

  has_and_belongs_to_many :users

  def self.admin
    find_or_create_by_name("admin")
  end
  
  def self.sms_verified
    find_or_create_by_name("sms_verified")
  end

end