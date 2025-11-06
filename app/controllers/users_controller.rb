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
    @user = User.load_from_activation_token(params[:id])

    if @user
      @user.activate!
      redirect_to login_path, success: t('users.create.success')
    else
      not_authenticated
    end
  end

  def new_activation; end

  def resend_activation
    email = params[:email].to_s.downcase
    user = User.find_by(email: email)

    if user && user.activation_state != 'active'
      # 期限切れ/未発行ならトークン作成
      if user.activation_token.blank? || user.activation_token_expires_at&.<(Time.current)
        user.setup_activation # トークン/期限をセット（保存は別）
        user.save(validate: false)
      end
      SignupMailer.activation_needed_email(user).deliver_now
    end

    redirect_to before_activate_path
  end

  def before_activate; end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :avatar_cache)
  end
end
