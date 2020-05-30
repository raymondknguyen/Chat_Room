require 'rails_helper'

describe 'As a logged in User' do
  before(:each) do
    @kate = User.create!( username: "Kayaking Kate",
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
   ashley = Owner.create(name: 'Ashley')
   @snowboard = GearItem.create(name: 'Snowboard', description: 'a board to snow', price: 250.5, condition: 0, status: 0, location: 'denver', owner: ashley)
   @bike = GearItem.create(name: 'BMX', description: 'fastest bike in town', price: 2.5, condition: 0, status: 0, location: 'denver', owner: ashley)
   @helmet = GearItem.create(name: 'Helmet', description: 'this will protect your head', price: 45.0, condition: 0, status: 0, location: 'denver', owner: ashley)
   @tent = GearItem.create(name: 'Tent', description: 'this tent will protect you from thunder', price: 224.5, condition: 0, status: 0, location: 'denver', owner: ashley)
   @kayak = GearItem.create(name: 'Kayak', description: 'Playboat to hit the biggest rapids', price: 30, condition: 0, status: 0, location: 'denver', owner: ashley)
   @rental_1 = Rental.create!(start_date: "2020-05-01", end_date: "2020-05-15", user_id: @kate.id, gear_item_id: @snowboard.id, status: "approved")
   @rental_2 = Rental.create!(start_date: "2020-05-25", end_date: "2020-06-10", user_id: @kate.id, gear_item_id: @bike.id, status: "approved")
   @rental_3 = Rental.create!(start_date: "2020-05-25", end_date: "2020-06-10", user_id: @kate.id, gear_item_id: @helmet.id, status: "approved")
   @rental_4 = Rental.create!(start_date: "2020-07-12", end_date: "2020-07-15", user_id: @kate.id, gear_item_id: @tent.id, status: "approved")
   @rental_5 = Rental.create!(start_date: "2020-07-25", end_date: "2020-07-30", user_id: @kate.id, gear_item_id: @kayak.id)


   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@kate)
   # visit '/'
   # click_on 'Profile'
 end


  it "can see my profile information" do
    visit '/profile'
    expect(current_path).to eq('/profile')
    within(".about_me") do
      expect(page).to have_content(@kate.about_me)
    end
    expect(page).to have_content(@kate.name)
    # test picture
  end


  it "can see rental information" do
    visit '/profile'
    within(".requested_rentals") do
      expect(page).to have_content(@kayak.name)
    end

    within(".current_rentals") do
      expect(page).to have_content(@helmet.name)
      expect(page).to have_content(@bike.name)
    end
    within(".upcoming_rentals") do
      expect(page).to have_content(@tent.name)
    end
    within(".past_rentals") do
      expect(page).to have_content(@snowboard.name)
    end
  end

  it "can click link to see messages" do
    visit '/profile'
    expect(page).to have_link("Messages")
  end

end
