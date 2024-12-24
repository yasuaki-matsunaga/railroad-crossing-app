class FavoritesController < ApplicationController
  def create
    @crossing = Crossing.find(params[:crossing_id])
    @post = Post.find(params[:post_id])
    current_user.favorite(@post)
  end

  def destroy
    @post = current_user.favorites.find(params[:id]).post
    @crossing = Crossing.find(params[:crossing_id])
    current_user.unfavorite(@post)
  end
end
