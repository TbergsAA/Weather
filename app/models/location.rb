class Location < ActiveRecord::Base

  validates :lat, :lng, presence: true
  
end
