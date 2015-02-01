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

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def strong_params

  end
  
end
