json.extract! notification, :id, :created_at, :updated_at
json.url user_notification_url(notification.recipient, notification, format: :json)
