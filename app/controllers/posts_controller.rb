class PostsController < ApplicationController
  before_action :require_login, only: %i[new create edit update destroy show]
  before_action :set_crossing, only: %i[new create edit update]

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
               .includes(crossing: [city: [:prefecture], linked_railways: []], user: [])
               .page(params[:page])
               .order(created_at: :desc)
    @tags = Post.tag_counts_on(:tags).most_used(20)
    if params[:tag_name]
      @posts = Post.tagged_with(params[:tag_name]).page(params[:page])
    end
  end

  def show
    @crossing = Crossing.includes(city: [:prefecture], linked_railways: [], posts: []).find(params[:crossing_id])
    @post = Post.includes(:user).find(params[:id])
    @tags = @post.tag_counts_on(:tags)
    @favorites = @post.favorites
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def edit
    @post = current_user.posts.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to posts_path, danger: "投稿が見つからないか、編集する権限がありません。"
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to crossing_path(params[:crossing_id]),
                  success: t('defaults.flash_message.created', item: Post.model_name.human)
    else
      flash.now[:danger] = t('defaults.flash_message.not_created', item: Post.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to crossing_post_path(@crossing, @post),
                  success: t('defaults.flash_message.updated', item: Post.model_name.human)
    else
      flash.now[:danger] = t('defaults.flash_message.not_updated', item: Post.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy!
    redirect_to crossing_path(@post.crossing_id), status: :see_other,
                success: t('defaults.flash_message.deleted', item: Post.model_name.human)
  end

  private

  def set_crossing
    @crossing = Crossing.find(params[:crossing_id])
  end

  def post_params
    params.require(:post)
          .permit(:title, :body, :crossing_image, :crossing_image_cache, :tag_list)
          .merge(crossing_id: params[:crossing_id])
  end
end
