class PostsController < ApplicationController
  before_action :require_login, only: %i[new create]

  def new
    @crossing = Crossing.find(params[:crossing_id])
    @post = Post.new
  end

  def edit
    @post = current_user.posts.find(params[:id])
    @crossing = Crossing.find(params[:crossing_id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to crossing_path(params[:crossing_id]), success: t('defaults.flash_message.created', item: Post.model_name.human)
    else
      flash.now[:danger] = t('defaults.flash_message.not_created', item: Post.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @post = current_user.posts.find(params[:id])
    @crossing = Crossing.find(params[:crossing_id])
    if @post.update(post_params)
      redirect_to crossing_post_path(@crossing, @post), success: t('defaults.flash_message.updated', item: Post.model_name.human)
    else
      flash.now[:danger] = t('defaults.flash_message.not_updated', item: Post.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @crossing = Crossing.includes(:linked_prefectures, :linked_cities, :linked_railways, :posts).find(params[:crossing_id])
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order(created_at: :desc)
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy!
    redirect_to crossing_path(@post.crossing_id), status: :see_other, success: t('defaults.flash_message.deleted', item: Post.model_name.human)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :crossing_image, :crossing_image_cache).merge(crossing_id: params[:crossing_id])
  end
end
