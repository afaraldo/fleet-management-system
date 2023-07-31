require 'csv'

namespace :db do
  desc 'Import cars from CSV'
  task import_cars: :environment do
    file_path = 'db/data/cars.csv'
    model_class = Car
    unique_by = [:plate_number]
    Importer.import(file_path, model_class, unique_by)
  end

  desc 'Import cars from CSV'
  task import_employees: :environment do
    file_path = 'db/data/employees.csv'
    model_class = Employee
    unique_by = [:document]
    Importer.import(file_path, model_class, unique_by)
  end

end
