require 'rails_helper'

describe "as a user" do
  describe "when I visit a gear item show page" do
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

     @collin = Owner.create(name: 'Collin')

     @snowboard = GearItem.create(name: 'Snowboard', description: 'a board to snow', price: 250.5, condition: 0, status: 0, location: 'Denver, CO', owner: @collin)

     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@kate)
   end

   it "I can request to rent that gear item" do
     visit "/gear_items/#{@snowboard.id}"

     click_link "Rent Gear"

     expect(current_path).to eq("/rental/#{@snowboard.id}")

     fill_in :name, with: "#{@kate.name}"
     fill_in :email_address, with: "#{@kate.email}"
     fill_in :start_date, with: "2020/11/10"
     fill_in :end_date, with: "2020/11/15"
     fill_in :message, with: "I would love to borrow your snowboard for my trip to Aspen"

     click_button "Submit"

     expect(current_path).to eq("/profile")

     expect(page).to have_content("You've successfully submitted a rental request!")

     within(".requested_rentals") do
       expect(page).to have_content(@snowboard.name)
     end
   end
 end
end
