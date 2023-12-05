# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
PaperTrail.request(whodunnit: 'iceberg.04@gmail.com') do
  organization_names = ['Gobernación Itapúa', 'Municipalidad de Cambyreta']
  organization_names.each do |name|
    organization = Organization.find_or_create_by!(name:)
    logo_path = Rails.root.join('app', 'assets', 'images', 'logos', "#{name}.png")
    # Attach logo
    organization.logo.attach(
      io: File.open(logo_path),
      filename: "#{name}.png",
      content_type: 'image/png'
    )
    MultiTenant.with(organization) do
      superuser = User.find_by(email: 'iceberg.04@gmail.com')
      unless superuser
        User.create(email: 'iceberg.04@gmail.com',
                    password: 'test123',
                    password_confirmation: 'test123',
                    role: :superadmin)
      end

      superuser = User.find_by(email: 'karina.sanabria75@gmail.com ')
      unless superuser
        User.create(email: 'karina.sanabria75@gmail.com',
                    password: 'test123',
                    password_confirmation: 'test123',
                    role: :superadmin)
      end
    end
  end
end
