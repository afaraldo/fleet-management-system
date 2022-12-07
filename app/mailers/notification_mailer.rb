# This class is Notification Mailer
class NotificationMailer < ApplicationMailer
  def notification_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
