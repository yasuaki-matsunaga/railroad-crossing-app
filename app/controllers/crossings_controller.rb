class CrossingsController < ApplicationController
  skip_before_action :require_login, only: %i[show]

  def show
    @crossing = Crossing.includes(city: [:prefecture], linked_railways:[], posts:[]).find(params[:id])
    @posts = @crossing.posts.order(created_at: :desc)

  end

end
