class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = login(params[:email], params[:password], params[:remember])

    if @user
      redirect_to root_path, success: t('user_sessions.create.success')
    else
      @user = User.new
      flash.now[:danger] = t('user_sessions.create.failure')
      render :new
    end
  end

  def destroy
    remember_me!
    forget_me!
    logout
    redirect_to root_path, status: :see_other, success: t('.success')
  end
end
