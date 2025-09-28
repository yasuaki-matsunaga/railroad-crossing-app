class CrossingFavoritesController < ApplicationController
  def create
    @crossing = Crossing.find(params[:crossing_id])
    current_user.crossing_favorite(@crossing)
  end

  def destroy
    @crossing = current_user.crossing_favorites.find(params[:id]).crossing
    current_user.crossing_unfavorite(@crossing)
  end
end
