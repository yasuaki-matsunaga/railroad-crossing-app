class ProfilesController < ApplicationController
  before_action :require_login
  before_action :set_user

  def edit; end
  
  def show; end

  def update
    if @user.update(user_params)
      redirect_to profile_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name)
  end

  def set_user
    @user = current_user
  end
end
