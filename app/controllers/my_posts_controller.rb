class MyPostsController < ApplicationController
  before_action :require_login, only: %i[index]

  def index
    @posts = current_user.posts.all.order(created_at: :desc)
  end
end
