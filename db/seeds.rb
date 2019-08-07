# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create!( first_name:  "app_admin1",
              last_name: "divine",
              email: "appadmin1@gmail.com",
              password: "admins",
              password_confirmation: "admins",
              is_admin: true )

user1.buses.create!(
  num_plate: "AC55 ABC",
  manufacturer: "Toyota",
  model: "Camry",
  year: "10/10/2015",
  capacity: 14,
  color: "red"
)