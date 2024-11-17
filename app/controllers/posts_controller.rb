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

  private

  def post_params
    params.require(:post).permit(:title, :body, :crossing_image, :crossing_image_cache).merge(crossing_id: params[:crossing_id])
  end
end