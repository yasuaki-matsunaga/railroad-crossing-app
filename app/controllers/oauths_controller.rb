class OauthsController < ApplicationController
  skip_before_action :require_login, raise: false

  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider].presence || 'google'
    if @user = login_from(provider)
      redirect_to root_path, success: t('user_sessions.google_login.success')
    else
      begin
        @user = create_from(provider)

        reset_session
        auto_login(@user)
        redirect_to root_path, success: t('user_sessions.google_login.success')
      rescue
        reset_session
        redirect_to root_path, danger: t('user_sessions.google_login.failure')
      end
    end
  end

  private

  def auth_params
    params.permit(:code, :provider, :scope, :authuser, :prompt)
  end
end
