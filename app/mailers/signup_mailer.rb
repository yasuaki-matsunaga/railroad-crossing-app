class SignupMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.signin_mailer.activation_needed_email.subject
  #
  def activation_needed_email(user)
    @user = user
    @url  = activate_user_url(@user.activation_token)
    mail(to: user.email, subject: "「フミキリのちず」への登録")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.signin_mailer.activation_success_email.subject
  #
  def activation_success_email(user)
    @user = user
    # @url  = login_url
    # mail(to: user.email, subject: "Your account is now activated")
  end
end
