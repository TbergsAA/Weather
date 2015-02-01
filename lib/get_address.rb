require 'net/http'

class GoogleGeocoding
  class << self
    def get_address(lat, lng)
      uri = URI("https://maps.googleapis.com/maps/api/geocode/json?latlng=#{lat},#{lng}&key=AIzaSyAEL4_5sH3wStQfHA74IXmB7QNepbqkMGw")
      req = Net::HTTP.get(uri)
      req 
    end
  end
end

# GoogleGeocoding.get_address(lat, lng)