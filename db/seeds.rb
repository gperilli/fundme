# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.exists? && Rails.env.development?
    puts "destroying all users" #if Rails.env.development?
    Donation.destroy_all #if Rails.env.development?
    User.destroy_all #if Rails.env.development?
end

puts "Creating Users and Admins"

# users
gareth = User.create!(password: "password", username: "gareth", first_name: "Gareth", last_name: "Perilli", email: "garethperilli@gmail.com")

# Admins
AdminUser.create!(email: 'garethperilli@gmail.com', password: 'password', password_confirmation: 'password')
