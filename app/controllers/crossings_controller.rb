class CrossingsController < ApplicationController
  skip_before_action :require_login, only: %i[show]

  def show
    @crossing = Crossing.find(params[:id])

    prefecture_id = CrossingPrefecture.find_by(crossing_id: @crossing.crossing_id).prefecture_id
    @prefecture = Prefecture.find(prefecture_id)

    city_id = CrossingCity.find_by(crossing_id: @crossing.crossing_id).city_id
    @city = City.find(city_id)

    railway_id = CrossingRailway.find_by(crossing_id: @crossing.crossing_id).railway_id
    @railway = Railway.find(railway_id)
  end

end
