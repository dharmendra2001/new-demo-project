class WelcomeMailer < ApplicationMailer

  def send_greeting_notification(user)
    @user = user
    mail to: @user.email, subject: "Thank you for signing upon our site"
  end
end
