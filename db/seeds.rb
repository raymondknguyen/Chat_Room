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
krista = User.create!( name: "Krista Stadler",
                     email: "stadler.krista@gmail.com",
                     about_me: 'I love living in Colorado and spending time in the mountains!',
                     profile_picture: "https://img.theweek.in/content/dam/week/magazine/health/quickscan/images/2019/7/20/10-Nature-the-best-healer.jpg")

puts "Created Users"

collin = Owner.create(name: 'Collin')
ashley = Owner.create(name: 'Ashley')
lucii = Owner.create(name: 'Lucii')

puts "Created Owners"

snowboard1 = GearItem.create(name: 'Rossignol One LF Snowboard', description: Faker::Lorem.paragraph, price: Faker::Commerce.price, condition: 0, status: 0, location: "1634 18th St, Denver, CO 80202", owner: collin, photo: "https://rqncr2pq51u34xp5y2t8cvy1-wpengine.netdna-ssl.com/wp-content/uploads/2019/10/Rossignol-One-LF-Snowboard-Mens.jpg")
snowboard2 = GearItem.create(name: 'Gnu Asym Carbon Credit Snowboard', description: Faker::Lorem.paragraph, price: Faker::Commerce.price, condition: 0, status: 0, location: "1662 South Pearl St, Denver, CO 80210", owner: collin, photo: "https://rqncr2pq51u34xp5y2t8cvy1-wpengine.netdna-ssl.com/wp-content/uploads/2019/10/Gnu-Asym-Carbon-Credit-Snowboard-Mens.jpg")
snowboard3 = GearItem.create(name: 'Ride Berzerker Snowboard', description: Faker::Lorem.paragraph, price: Faker::Commerce.price, condition: 0, status: 0, location: "500 Linden St, Fort Collins, CO 80524", owner: collin, photo: "https://rqncr2pq51u34xp5y2t8cvy1-wpengine.netdna-ssl.com/wp-content/uploads/2019/10/Ride-Berzerker-Wide-Snowboard-Mens.jpg")
snowboard4 = GearItem.create(name: 'K2 Secret Weapon Snowboard', description: Faker::Lorem.paragraph, price: Faker::Commerce.price, condition: 0, status: 0, location: "120 Lower, Carriage Way, Snowmass Village, CO 81615", owner: collin, photo: "https://rqncr2pq51u34xp5y2t8cvy1-wpengine.netdna-ssl.com/wp-content/uploads/2019/10/K2-2020-Secret-Weapon-Mens-Snowboard.jpg")
snowboard5 = GearItem.create(name: 'Burton Name Dropper Snowboard', description: Faker::Lorem.paragraph, price: Faker::Commerce.price, condition: 0, status: 0, location: "4580 Broadway, Boulder, CO 80304", owner: collin, photo: "https://rqncr2pq51u34xp5y2t8cvy1-wpengine.netdna-ssl.com/wp-content/uploads/2019/10/Burton-Name-Dropper-Snowboard.jpg")

snowshoes1 = GearItem.create(name: 'MSR EVO 22 SNOWSHOE', description: Faker::Lorem.paragraph, price: Faker::Commerce.price, condition: 0, status: 0, location: "16539 Washington St, Thornton, CO 80023", owner: collin, photo: "https://2or2n61eranl2ilm943t35jn-wpengine.netdna-ssl.com/wp-content/uploads/2016/08/51zH9XXK6SL.SL160.jpg")
snowshoes2 = GearItem.create(name: 'CHINOOK TREKKER SNOWSHOES', description: Faker::Lorem.paragraph, price: Faker::Commerce.price, condition: 0, status: 0, location: "1331 17th St, Denver, CO 80202", owner: collin, photo: "https://2or2n61eranl2ilm943t35jn-wpengine.netdna-ssl.com/wp-content/uploads/2016/08/51lM4UhMd8L.SL160.jpg")
snowshoes3 = GearItem.create(name: 'REDFEATHER HIKE SNOWSHOE KIT', description: Faker::Lorem.paragraph, price: Faker::Commerce.price, condition: 0, status: 0, location: "2922 Baseline Rd, Boulder, CO 80303", owner: collin, photo: "https://2or2n61eranl2ilm943t35jn-wpengine.netdna-ssl.com/wp-content/uploads/2017/09/51t1QgN6LL.SL160.jpg")
snowshoes4 = GearItem.create(name: 'Winterial Snowshoes', description: Faker::Lorem.paragraph, price: Faker::Commerce.price, condition: 0, status: 0, location: "250 Spader Way, Broomfield, CO 80020", owner: collin, photo: "https://2or2n61eranl2ilm943t35jn-wpengine.netdna-ssl.com/wp-content/uploads/2017/12/51bOvA7E6ZL.jpg")
snowshoes5 = GearItem.create(name: 'Atlas Endeavor Snowshoes Review', description: Faker::Lorem.paragraph, price: Faker::Commerce.price, condition: 0, status: 0, location: "8500 Peña Blvd, Denver, CO 80249", owner: collin, photo: "https://2or2n61eranl2ilm943t35jn-wpengine.netdna-ssl.com/wp-content/uploads/2017/03/41P0Xu04HRL.jpg")

bike1 = GearItem.create(name: 'Cannondale Bad Habit Bike', description: Faker::Lorem.paragraph, price: Faker::Commerce.price, condition: 0, status: 0, location: "16539 Washington St, Thornton, CO 80023", owner: collin, photo: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/1/cannondale-bad-habit-556-1520447534.jpg")
bike2 = GearItem.create(name: 'Liv Lust Advanced 1 Bike', description: Faker::Lorem.paragraph, price: Faker::Commerce.price, condition: 0, status: 0, location: "1331 17th St, Denver, CO 80202", owner: collin, photo: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/1/lust-advanced-1-carbon-556-1520447534.jpg")
bike3 = GearItem.create(name: 'Yeti SB130 TURQ X01 2019 Bike', description: Faker::Lorem.paragraph, price: Faker::Commerce.price, condition: 0, status: 0, location: "2922 Baseline Rd, Boulder, CO 80303", owner: collin, photo: "https://outdoorgearlab-mvnab3pwrvp3t0.stackpathdns.com/photos/22/86/350096_28004_S.jpg")
bike4 = GearItem.create(name: 'Santa Cruz Hightower CC XO1 Bike', description: Faker::Lorem.paragraph, price: Faker::Commerce.price, condition: 0, status: 0, location: "250 Spader Way, Broomfield, CO 80020", owner: collin, photo: "https://outdoorgearlab-mvnab3pwrvp3t0.stackpathdns.com/photos/20/32/324677_31885_S.jpg")
bike5 = GearItem.create(name: 'Ibis Ripley GX Eagle 2019 Bike', description: Faker::Lorem.paragraph, price: Faker::Commerce.price, condition: 0, status: 0, location: "8500 Peña Blvd, Denver, CO 80249", owner: collin, photo: "https://outdoorgearlab-mvnab3pwrvp3t0.stackpathdns.com/photos/19/48/316277_12754_S.jpg")

helmet1 = GearItem.create(name: 'BONTRAGER HELMET', description: Faker::Lorem.paragraph, price: Faker::Commerce.price, condition: 0, status: 0, location: "1634 18th St, Denver, CO 80202", owner: collin, photo: "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1556721990-bontrager-specter-wavecel-road-helmet-1556721975.jpg")
helmet2 = GearItem.create(name: 'Giro Aether MIPS Helmet', description: Faker::Lorem.paragraph, price: Faker::Commerce.price, condition: 0, status: 0, location: "1662 South Pearl St, Denver, CO 80210", owner: collin, photo: "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1556722010-giro-aether-mips-1556722003.jpg")
helmet3 = GearItem.create(name: 'Bontrager Specter Wavecel Road Helmet', description: Faker::Lorem.paragraph, price: Faker::Commerce.price, condition: 0, status: 0, location: "500 Linden St, Fort Collins, CO 80524", owner: collin, photo: "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1556721990-bontrager-specter-wavecel-road-helmet-1556721975.jpg")
helmet4 = GearItem.create(name: 'Nutcase Metroride MIPS Helmet', description: Faker::Lorem.paragraph, price: Faker::Commerce.price, condition: 0, status: 0, location: "120 Lower, Carriage Way, Snowmass Village, CO 81615", owner: collin, photo: "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1556722025-nutcase-metroride-mips-1556722019.jpg")
helmet5 = GearItem.create(name: 'Bern Allston Helmet', description: Faker::Lorem.paragraph, price: Faker::Commerce.price, condition: 0, status: 0, location: "4580 Broadway, Boulder, CO 80304", owner: collin, photo: "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1556722064-bern-allston-1556722054.jpg")

tent = GearItem.create(name: 'Mountain Hardware Stronghold Tent', description: Faker::Lorem.paragraph, price: Faker::Commerce.price, condition: 0, status: 0, location: "2001 Blake St, Denver, CO 80205", owner: collin, photo: 'https://cdn0.wideopenspaces.com/wp-content/uploads/2014/09/62.jpg')
camper = GearItem.create(name: '2021 WINNEBAGO MINNIE WINNIE 22M Camper', description: Faker::Lorem.paragraph, price: Faker::Commerce.price, condition: 0, status: 0, location: "14504 E I25 Frontage Rd, Longmont, CO 80504", owner: collin, photo: 'https://images.rvs.com/KC1/1746354/500x/2021_winnebago_minnie_winnie_22m_kc11746354_1.jpg')

puts "Created Items"

rental_1 = Rental.create!(start_date: "2020-05-01", end_date: "2020-05-15", user_id: margo.id, gear_item_id: tent.id, status: 'approved')
rental_2 = Rental.create!(start_date: "2020-06-05", end_date: "2020-06-10", user_id: kate.id, gear_item_id: camper.id)
rental_3 = Rental.create!(start_date: "2020-05-30", end_date: "2020-06-12", user_id: margo.id, gear_item_id: snowboard1.id, status: 'approved')
rental_4 = Rental.create!(start_date: "2020-07-10", end_date: "2020-07-15", user_id: margo.id, gear_item_id: snowshoes2.id)
rental_5 = Rental.create!(start_date: "2020-07-10", end_date: "2020-07-15", user_id: margo.id, gear_item_id: helmet3.id, status: 'approved')

puts "Created Rentals"
