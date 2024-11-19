class PostsController < ApplicationController
  before_action :require_login, only: %i[new create]

  def new
    @crossing = Crossing.find(params[:crossing_id])
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @crossing = Crossing.includes(:linked_prefectures, :linked_cities, :linked_railways, :posts).find(params[:crossing_id])

    @prefecture = @crossing.linked_prefectures.first
    @city = @crossing.linked_cities.first
    @railway = @crossing.linked_railways.first

    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :crossing_image, :crossing_image_cache).merge(crossing_id: params[:crossing_id])
  end
end
