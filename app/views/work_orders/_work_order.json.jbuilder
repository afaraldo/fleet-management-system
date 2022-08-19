json.extract! work_order, :id, :date, :requested_by, :reason, :manager, :created_at, :updated_at
json.url work_order_url(work_order, format: :json)
