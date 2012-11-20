class Place < ActiveRecord::Base
  attr_accessible :desc, :lat, :lng, :name, :owner_id
end
