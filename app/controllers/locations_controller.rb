class LocationsController < ApplicationController

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

  private

  def location_params
    params.require(:location).permit(:lat, :lng)
  end  

end
