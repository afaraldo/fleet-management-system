# This class is Notification Mailer
class NotificationMailer < ApplicationMailer
  def event_notification
    mail(to: @user.email, subject: @user.email)
  end
end
