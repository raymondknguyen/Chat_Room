# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

kate = User.create!( username: "Kayaking Kate",
                       name: "Kate Smith",
                       email: "kate@example.com",
                       password: "password",
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
                       password: "password",
                       street_address: "540 Turner Street",
                       state: "MT",
                       zip: "57894",
                       profile_picture: "https://nationalpostcom.files.wordpress.com/2018/05/gettyimages-862209732.jpg?quality=80&strip=all&w=780",
                       phone_number: "(784) 658-8754",
                       age: "54",
                       about_me: "I love to travel with my wife and kids to new places."
                     )
hillary = User.create!( username: "Hiking Hillary",
                       name: "Hillary Jones",
                       email: "hillary@example.com",
                       password: "password",
                       street_address: "415 Wewatta Street",
                       state: "CO",
                       zip: "80501",
                       profile_picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQfyaxSAV51PUwMLdxzLnqb49v0N30Di219dn1A1csH9_BTsFbk&usqp=CAU",
                       phone_number: "(303) 201-8795",
                       age: "32",
                       about_me: "Being outdoors is my favorite place to be."
                     )
