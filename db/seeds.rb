# typed: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Main Sample User
User.create(name: "Sample User",
            email: "example@dummy.org",
            password: "admin#1234",
            password_confirmation: "admin#1234",
            activated: true,
            activated_at: Time.zone.now
           )

99.times do |i|
  name = Faker::Name.masculine_name
  email = "dummy-#{i + 1}@dummy.org"
  password = "password"
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now
  )
end
