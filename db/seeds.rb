# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 admin = User.create(
    :email => "admin@gmail.com",
    :password => "12345678",
    :password_confirmation => "12345678",
    :first_name => "admin",
    :last_name => "admin",
    :admin => true
)
 dealer = User.create(
    :email => "dealer@gmail.com",
    :password => "12345678",
    :password_confirmation => "12345678",
    :first_name => "dealer",
    :last_name => "dealer",
    :dealer => "dealer"
)

 product = Product.create([
  { name: "Maruti 800", category_id: "1",photo_file_name: "http://media1.santabanta.com/full1/Cars/Vintage%20and%20Classic%20Cars/vintage-and-classic-cars-52a.jpg", photo_content_type: "image/jpeg", photo_file_size: 68656, user_id: 2, price: 678908, quantity: 100, deal: false, category_name: nil },
  { name: "Maruti 800", category_id: "2",photo_file_name: "http://media1.santabanta.com/full1/Cars/Vintage%20and%20Classic%20Cars/vintage-and-classic-cars-52a.jpg", photo_content_type: "image/jpeg", photo_file_size: 68656, user_id: 2, price: 45672, quantity: 100, deal: false, category_name: nil }
])

category = Category.create([
  { name: "Maruti"},
  { name: "Mahindra"}
])


