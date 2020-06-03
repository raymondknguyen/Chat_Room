# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rental.destroy_all
User.destroy_all
GearItem.destroy_all
Owner.destroy_all
puts "Cleared DB!"

kate = User.create!( username: "Kayaking Kate",
                       name: "Kate Smith",
                       email: "kate@example.com",
                       street_address: "123 Mulberry Street",
                       state: "CO",
                       zip: "80303",
                       profile_picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQDNCFOXFv30vvRl4plrMuwCltmT5m4TzAtszYfm8XrLP7PLgKH&usqp=CAU",
                       phone_number: "(123) 456-7891",
                       age: "25",
                       about_me: "I love travelling and going on adventures with my favorite side-kick -- my dog, Jack."
                     )
alex = User.create!( username: "Adventurous Alex",
                       name: "Alex Rodriguez",
                       email: "alex@example.com",
                       street_address: "540 Turner Street",
                       state: "MT",
                       zip: "57894",
                       profile_picture: "https://nationalpostcom.files.wordpress.com/2018/05/gettyimages-862209732.jpg?quality=80&strip=all&w=780",
                       phone_number: "(784) 658-8754",
                       age: "54",
                       about_me: "I love to travel with my wife and kids to new places."
                     )

margo = User.create!( name: "Margo Flewelling",
                      email: "flewelling.margo@gmail.com",
                      about_me: 'Outdoors enthusiast. I love skiing, climbing, and biking with my pup Roo',
                      profile_picture: "https://images.robertharding.com/preview/RF/CI/HORIZONTAL/857-78896.jpg")

hillary = User.create!( username: "Hiking Hillary",
                       name: "Hillary Jones",
                       email: "hillary@example.com",
                       street_address: "415 Wewatta Street",
                       state: "CO",
                       zip: "80501",
                       profile_picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQfyaxSAV51PUwMLdxzLnqb49v0N30Di219dn1A1csH9_BTsFbk&usqp=CAU",
                       phone_number: "(303) 201-8795",
                       age: "32",
                       about_me: "Being outdoors is my favorite place to be."
                     )

collin = Owner.create(name: 'Collin')
ashley = Owner.create(name: 'Ashley')
lucii = Owner.create(name: 'Lucii')

snowboard = GearItem.create(
  name: 'Snowboard',
  description: 'a board to snow',
  price: 250.5,
  condition: 0,
  status: 0,
  location: 'denver',
  owner: collin
)
bike = GearItem.create(
  name: 'BMX',
  description: 'fastest bike in town',
  price: 2.5,
  condition: 0,
  status: 0,
  location: 'denver',
  owner: collin
)
helmet = GearItem.create(
  name: 'Helmet',
  description: 'this will protect your head',
  price: 45.0,
  condition: 0,
  status: 0,
  location: 'denver',
  owner: collin,
  photo: 'https://smhttp-ssl-58099.nexcesscdn.net/pub/media/catalog/product/cache/1/image/700x560/e9c3970ab036de70892d86c6d221abfe/r/f/rf-1100-black.png'
)
tent = GearItem.create(
  name: 'Tent',
  description: 'this tent will protect you from thunder',
  price: 224.5,
  condition: 0,
  status: 0,
  location: 'denver',
  owner: collin
)
camper = GearItem.create(
  name: 'Big Camper',
  description: 'take it in the water and you have nothing',
  price: 200.5,
  condition: 0,
  status: 0,
  location: 'denver',
  owner: collin
)

skates = GearItem.create(name: 'Skates', description: 'skates that will roll circles around your neighbor', price: 85.5, condition: 0, status: 0, location: 'denver', owner: ashley)
ski = GearItem.create(name: 'Skis', description: 'skis to ski', price: 100.5, condition: 0, status: 0, location: 'aurora', owner: ashley)
bench = GearItem.create(name: 'Bench', description: 'you sit on this', price: 95.0, condition: 0, status: 0, location: 'aurora', owner: ashley)

helmet_2 = GearItem.create(name: 'Purple Helmet', description: 'do not break your head', price: 35.0, condition: 0, status: 0, location: 'aurora', owner: lucii)

rental_1 = Rental.create!(start_date: "2020-05-01", end_date: "2020-05-15", user_id: margo.id, gear_item_id: tent.id, status: 'approved')
rental_2 = Rental.create!(start_date: "2020-06-05", end_date: "2020-06-10", user_id: kate.id, gear_item_id: camper.id)
rental_3 = Rental.create!(start_date: "2020-05-30", end_date: "2020-06-12", user_id: margo.id, gear_item_id: snowboard.id, status: 'approved')
rental_4 = Rental.create!(start_date: "2020-07-10", end_date: "2020-07-15", user_id: margo.id, gear_item_id: bike.id)
rental_5 = Rental.create!(start_date: "2020-07-10", end_date: "2020-07-15", user_id: margo.id, gear_item_id: helmet.id, status: 'approved')
