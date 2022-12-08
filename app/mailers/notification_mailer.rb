# This class is Notification Mailer
class NotificationMailer < ApplicationMailer
  def event_notification
    mail(to: 'afaraldo@protonmail.com', subject: I18n.t('notification_message'))
  end
end
