require 'csv'

namespace :db do
  desc 'Import cars from CSV'
  task :import_cars, %i[relative_path organization_name] => :environment do |t, args|
    raise 'No file path provided' if args[:relative_path].nil?

    base_path = Rails.root.to_s
    file_path = File.join(base_path, args[:relative_path])
    model_class = Car
    organization_id = Organization.find_by(name: args[:organization_name]).id
    unique_by = %i[plate_number organization_id]
    result = Importer.import(file_path, model_class, organization_id, unique_by)

    puts "Object importerd: #{result}"
  end

  desc 'Import employee from CSV'
  task :import_employees, %i[relative_path organization_name] => :environment do |t, args|
    raise 'No file path provided' if args[:relative_path].nil?

    base_path = Rails.root.to_s
    file_path = File.join(base_path, args[:relative_path])
    model_class = Employee
    organization_id = Organization.find_by(name: args[:organization_name]).id
    unique_by = %i[document organization_id]
    result = Importer.import(file_path, model_class, organization_id, unique_by)

    puts "Object importerd: #{result}"
  end
end
