class ProfilesController < ApplicationController
  before_action :require_login, only: %i[edit show update]
  before_action :set_user

  def edit; end
  
  def show; end

  def update
    if @user.update(user_params)
      redirect_to profile_path, success: t('defaults.flash_message.updated', item: 'プロフィール')
    else
      flash.now[:danger] = t('defaults.flash_message.not_updated', item: 'プロフィール')
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :avatar)
  end

  def set_user
    @user = current_user
  end
end
