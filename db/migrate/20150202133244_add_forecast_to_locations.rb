class AddForecastToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :forecast, :text
  end
end
