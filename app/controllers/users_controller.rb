class UsersController < ApplicationController
  # skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to before_activate_path
    else
      flash.now[:danger] = t('users.create.failure')
      render :new, status: :unprocessable_entity
    end
  end

  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to login_path, success: t('users.create.success')
    else
      not_authenticated
    end
  end

  def before_activate; end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :avatar_cache)
  end
end
