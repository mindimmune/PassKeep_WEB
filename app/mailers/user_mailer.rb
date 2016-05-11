class UserMailer < ApplicationMailer

  def activation_needed_email(user)
    @url = activate_user_registration_url(user.activation_token)
    mail(:to => user.email,
     :subject => t('.subject'))
  end

  def activation_success_email(user)
    @url = signin_url
    mail(:to => user.email,
     :subject => t('.subject'))
  end

  def reset_password_email(user)
    @url  = edit_password_reset_url(user.reset_password_token)
    mail(:to => user.email,
     :subject => t('.subject'))
  end
end
