class PasswordResetsController < ApplicationController
  skip_before_action :require_login

  def new; end

  def edit
    @token = params[:id]
    # load_from_reset_password_token→モデルからトークンを探し、トークンが見つかり且つ有効であればユーザーを返す。
    @user = User.load_from_reset_password_token(params[:id])
    not_authenticated if @user.blank?
  end

  def create
    @user = User.find_by(email: params[:email])
    # @user&.はif @userと機能的には同じ
    @user&.deliver_reset_password_instructions!
    redirect_to login_path, success: t('.success')
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(@token)

    return not_authenticated if @user.blank?

    # password_confirmation属性の有効性を確認
    @user.password_confirmation = params[:user][:password_confirmation]
    # トークンをクリアして、ユーザーの新しいパスワードを更新しようとする。
    if @user.change_password(params[:user][:password])
      redirect_to login_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :edit
    end
  end
end
