json.extract! work_order, :id, :fecha, :solicitado_por, :encargado, :created_at, :updated_at
json.url work_order_url(work_order, format: :json)
