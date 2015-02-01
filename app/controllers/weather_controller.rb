class WeatherController < ApplicationController

  def index
  end

  def current
    get_current_weather
  end

  def id
    get_id
  end

  private

  def get_current_weather
    if params["lat"].present? && params["lng"].present?
      @by_coords = GetWeather.by_coordinates(params["lat"], params["lng"])
    end

    if params["city"].present? && params["country"].present?
      @by_city = GetWeather.by_city(params["city"], params["country"])
    end

  end

end
