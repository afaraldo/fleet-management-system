# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

100.times do
  FactoryBot.create(:car)
end

100.times do
  FactoryBot.create(:work_order)
end

User.find_or_create_by!(username: 'admin@email.com', password: 'test123')
InsuranceCarrier.create(name: 'Fenix', ruc: '4763428')
MechanicalWorkshop.create(name: 'Taller Juanka', ruc: '4763409')
