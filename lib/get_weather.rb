require 'open_weather'

class GetWeather
  class << self
    def by_coordinates(lat, lng)
      forecast = OpenWeather::Current.geocode(lat, lng)
      "#{forecast["weather"].first["description"]}, humidity: #{forecast["main"]["humidity"]}, wind speed: #{forecast["wind"]["speed"]}, temp min: #{forecast["main"]["temp_min"]}, temp max: #{forecast["main"]["temp_max"]
}, sea lvl: #{forecast["main"]["sea_level"]}"
    end
  end
end

# GetWeather.by_coordinates(56.962764, 24.177146)