json.extract! car, :id, :make, :model, :color, :plate_number, :chassis, :created_at, :updated_at, :text
json.url car_url(car, format: :json)
