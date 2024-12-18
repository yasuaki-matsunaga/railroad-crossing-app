class DropCrossingCities < ActiveRecord::Migration[7.0]
  def change
    drop_table :crossing_cities
  end
end
