class UserMailer < ApplicationMailer
  default from: "abc@example.com"

  def welcome_email(user)
    @user = user
    @url = 'http://example.io/login'
    mail(to: user.username, subject: 'Welcome to 99 Cats')
  end
end
