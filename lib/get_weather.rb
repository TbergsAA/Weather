require 'open_weather'

class GetWeather

  class << self

    def by_coordinates(lat, lng)
      ::OpenWeather::Current.geocode(lat, lng)
    end
  end

end

