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
    AdminUser.destroy_all
    Ddpage.destroy_all
    TextBlock.destroy_all
    SitewideText.destroy_all
end

puts "Creating Users and Admins"

# users
gareth = User.create!(password: "password", username: "gareth", first_name: "Gareth", last_name: "Perilli", email: "gareth@gperilli.dev")

# Admins
AdminUser.create!(email: 'gareth@fundme.org', password: 'password', password_confirmation: 'password')


home_page = Ddpage.create!(title: 'home', en: 'home', es: 'home', pt: 'home', is_published: true)
TextBlock.create!(title: 'about', order: 1, en: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', es: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', pt: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', ddpage_id: home_page.id)
SitewideText.create!(name: 'tag line', en: 'Support our project. Make a donation!', es: 'Apoya nuestro proyecto. ??Haz una donaci??n!', pt: 'Apoie nosso projeto. Fa??a uma doa????o!')
SitewideText.create!(name: 'make a donation', en: 'make a donation!', es: '??Haz una donaci??n!', pt: 'Fa??a uma doa????o!' )
SitewideText.create!(name: 'payment advice', en: 'payment advice', es: 'payment advice', pt: 'payment advice' )
SitewideText.create!(name: 'payment page message', en: 'Make your donation.', es: 'Haz tu donaci??n.', pt: 'Fa??a sua doa????o.' )
SitewideText.create!(name: 'donation completed message', en: 'Thank you for your donation.', es: 'Gracias por tu donaci??n.', pt: 'Obrigado por sua doa????o.' )
SitewideText.create!(name: '$200 year', en: '$200 / YEAR', es: '$200 / A??O', pt: '$200 / ANO' )
SitewideText.create!(name: '$20 month', en: '$20 / MONTH', es: '$20 / MES', pt: '$20 / M??S' )
SitewideText.create!(name: 'one time donation', en: 'one time donation', es: 'donaci??n ??nica', pt: 'doa????o ??nica' )
SitewideText.create!(name: 'sign up page message', en: 'Sign up and start funding this project.', es: 'Reg??strate y empieza a financiar este proyecto.', pt: 'Inscreva-se e comece a financiar este projeto.' )
SitewideText.create!(name: 'support us', en: 'Support Us', es: 'Apoyanos', pt: 'Apoie-nos')
