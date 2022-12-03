# Notification Controller
class NotificationsController < ApplicationController
  before_action :set_user, only: %i[index show destroy]
  before_action :set_notification, only: %i[show destroy]

  respond_to :html
  def index
    # Use for breadcrumbs_on_rails gem
    add_breadcrumb I18n.t('activerecord.models.notification.other'), user_notifications_url(only_path: true)
    @q = @user.notifications.ransack(params[:q])
    @notifications = @q.result(distinct: true).page(params[:page]).per(5)
    respond_with(@notifications)
  end

  def show
    # Use for breadcrumbs_on_rails gem
    add_breadcrumb I18n.t('activerecord.models.
# Use for breadcrumbs_on_rails gemnotification.other'), user_notifications_url(only_path: true)
    add_breadcrumb I18n.t('buttons.show'), nil
    @notification.mark_as_read!
    respond_with(@notification)
  end

  def destroy
    @notification.destroy
    respond_with(@user, @notification)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_notification
    @notification = @user.notifications.find(params[:id])
  end
end
