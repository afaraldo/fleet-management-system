# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
PaperTrail.request(whodunnit: 'Administrador') do
  100.times do
    FactoryBot.create(:car)
  end

  100.times do
    FactoryBot.create(:work_order)
  end

  50.times do
    FactoryBot.create(:insurance_carrier)
  end

  50.times do
    FactoryBot.create(:mechanical_workshop)
  end

  3.times do
    FactoryBot.create(:maintenance)
  end

  superuser = User.find_or_create_by(email: 'admin@email.com')
  superuser.update(password: 'test123')
end
<<<<<<< HEAD
=======

3.times do
  FactoryBot.create(:maintenance)
end

# User.find_or_create!(email: 'admin@email.com', password: 'test123')
>>>>>>> Abm_mantenimientos
