# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:address
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create default admin user
AdminUser.create!(email: 'alexandre@tournaud.com', password: 'showpcaselewagon', password_confirmation: 'showpcaselewagon')

Shop.create(name: "Charming Mansion in Montmartre", street_address: "12, impasse Marie-Blanche")
Shop.create(name: "Lovely studio Raspail", street_address: "9, rue d'Odessa")
Shop.create(name: "Nice Shop. Bonne Nouvelle", street_address: "18, rue d'Hauteville")
Shop.create(name: "Awesome House near Buttes-Chaumont", street_address: "18, rue de l'Atlas")


# require 'faker'

# 30.times do
#   User.create(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.email,
#     password: "12345678")
# end

#   User.create(
#   first_name: "admin",
#   last_name: "admin",
#   email: "admin@admin.com",
#   password: "adminadmin",
#   admin: true)


# 30.times do
#   user_id = rand(1..9)
#   user_id.even? ? city = Faker::Address.city_prefix + Faker::Name.last_name.downcase : city = Faker::Name.last_name + Faker::Address.city_suffix
#   price = 100 * rand(10..2000)
#   Shop.create(
#     name: Faker::Company.name,
#     description: Faker::Lorem.paragraph(8, true, 8),
#     street_address: Faker::Address.street_address,
#     zipcode: Faker::Address.zip_code,
#     city: city,
#     country: Faker::Address.country,
#     price: price,
#     user_id: user_id)
# end

# i = 1
# 10.times do
#   price = 100 * rand(100..10000)
#   Booking.create(
#   user_id: i,
#   shop_id: 18 - i,
#   start_date: Date.new(2014, 8, 25),
#   end_date: Date.new(2014, 12, 12),
#   price: price)
#   i += 1
# end








