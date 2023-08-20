json.extract! supplier, :id, :name, :ruc, :type, :created_at, :updated_at, :text
json.url supplier_url(supplier, format: :json)
