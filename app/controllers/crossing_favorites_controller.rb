class CrossingFavoritesController < ApplicationController
  def index
    @favorite_crossings = current_user.crossing_favorites.includes(crossing: [{ city: :prefecture }, :linked_railways]).order(created_at: :desc)  
  end

  def create
    @crossing = Crossing.find(params[:crossing_id])
    current_user.crossing_favorite(@crossing)
  end

  def destroy
    @crossing = current_user.crossing_favorites.find(params[:id]).crossing
    current_user.crossing_unfavorite(@crossing)
  end
end
