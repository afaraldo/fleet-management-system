json.extract! employee, :id, :nombre, :apellido, :documento, :direccion, :telefono, :created_at, :updated_at
json.url employee_url(employee, format: :json)
