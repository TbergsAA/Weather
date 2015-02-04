class LocationsController < ApplicationController

  before_action :current_weather, only: [:show]

  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params["id"])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    @location.address = check_for_address
    @location.forecast = GetWeather.by_coordinates(params["location"]["lat"], params["location"]["lng"])
    if @location.save
      redirect_to action: "index"
    else
      redirect_to action: "new"
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    
    if @location.update_attributes(location_params)
      redirect_to action: "index"
    else
      render action: "edit"
    end 
  end

  def destroy
    if Location.find(params["id"]).destroy
      redirect_to action: "index"
    end
  end

  def sync
    @location = Location.find(params["id"])
    unless @location.last_sync_at == DateTime.now
      @location.update_attribute(:last_sync_at, DateTime.now)
      @location.update_attribute(:forecast, GetWeather.by_coordinates(@location.lat, @location.lng))
    end
    flash[:notice] = "Sync done!"
    redirect_to action: "index"
  end

  private

  def location_params
    params.require(:location).permit(:lat, :lng, :address)
  end  

  def check_for_address
    location = Location.where(lat: params["location"]["lat"], lng:params["location"]["lng"]).first
    if location.present?
       location.address
    else
      GoogleGeocoding.get_address(params["location"]["lat"], params["location"]["lng"])
    end
  end  

  def current_weather
    location = Location.find(params["id"])
    unless location.last_sync_at == Time.now
      location.update_attribute(:last_sync_at, Time.now)
      location.update_attribute(:forecast, GetWeather.by_coordinates(location.lat, location.lng))
    end
  end
end
