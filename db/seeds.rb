# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
PaperTrail.request(whodunnit: 'Administrador') do
  superuser = User.find_by(email: 'admin@email.com')
  unless superuser
    User.create(email: 'admin@email.com',
                password: 'test123',
                password_confirmation: 'test123',
                role: :admin)
  end

  superuser = User.find_by(email: 'iceberg.04@gmail.com')
  unless superuser
    User.create(email: 'iceberg.04@gmail.com',
                password: 'test123',
                password_confirmation: 'test123',
                role: :admin)
  end

  superuser = User.find_by(email: 'karina.sanabria75@gmail.com ')
  unless superuser
    User.create(email: 'karina.sanabria75@gmail.com',
                password: 'test123',
                password_confirmation: 'test123',
                role: :admin)
  end

  100.times do
    FactoryBot.create(:car)
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

  100.times do
    FactoryBot.create(:work_order)
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger.fatal e
  end
end
