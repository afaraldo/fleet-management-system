# frozen_string_literal: true

# `NotificationComponent` handles the display and behavior of user notifications.
# This component displays notifications based on received events and provides an interface for user interactions.
class NotificationComponent < ViewComponent::Base
  def initialize(notifications:, link_to_all_notification:)
    super
    @notifications = notifications
    @link_to_all_notification = link_to_all_notification
  end
end
