class CrossingsController < ApplicationController
  skip_before_action :require_login, only: %i[show]

  def show
    @crossing = Crossing.includes(:linked_prefectures, :linked_cities, :linked_railways, :posts).find(params[:id])

    @prefecture = @crossing.linked_prefectures.first
    @city = @crossing.linked_cities.first
    @railway = @crossing.linked_railways.first

    @posts = @crossing.posts.order(created_at: :desc)

  end

end
