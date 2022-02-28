class UserMailer < ApplicationMailer
  default from: 'notification@example.com'

  def welcome_email
    @user = params[:user]
    @url = 'http://alpha-blog.com/login'
    mail(to: @user.email, subject: 'Welcome to My Alpha-blog Site')
  end
end
