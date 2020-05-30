require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    it { should validate_uniqueness_of(:username)}


    it {should validate_presence_of(:name)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password)}
    it {should validate_presence_of(:street_address)}
    it {should validate_presence_of(:state)}
    it {should validate_presence_of(:zip)}
    it {should validate_presence_of(:phone_number)}
    it {should validate_numericality_of(:age)}

  end

  describe 'relationships' do
    it {should have_many(:rentals)}
    it {should have_many(:gear_items).through(:rentals)}
  end

  describe 'instance_methods' do
    it "can get current/past/future/requested rentals for a user" do
    @kate = User.create!( username: "Kayaker Kate",
                           name: "Kate Smith",
                           email: "katesmith@example.com",
                           password: "password",
                           street_address: "123 Mulberry Street",
                           state: "CO",
                           zip: "80303",
                           profile_picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQDNCFOXFv30vvRl4plrMuwCltmT5m4TzAtszYfm8XrLP7PLgKH&usqp=CAU",
                           phone_number: "(123) 456-7891",
                           age: "25",
                           about_me: "I love travelling and going on adventures with my favorite side-kick -- my dog, Jack."
                         )
   @jack = User.create!( username: "Adventure Jack",
                        name: "Jack Black",
                        email: "jack@example.com",
                        password: "password",
                        street_address: "123 Mulberry Street",
                        state: "CO",
                        zip: "80303",
                        profile_picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQDNCFOXFv30vvRl4plrMuwCltmT5m4TzAtszYfm8XrLP7PLgKH&usqp=CAU",
                        phone_number: "(923) 333-3333",
                        age: "30",
                        about_me: "I love shredding the pow."
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
   @rental_6 = Rental.create!(start_date: "2020-05-25", end_date: "2020-06-04", user_id: @jack.id, gear_item_id: @snowboard.id)
   @rental_7 = Rental.create!(start_date: "2020-03-05", end_date: "2020-03-12", user_id: @jack.id, gear_item_id: @kayak.id)

   expect(@kate.current_rentals).to include(@rental_2)
   expect(@kate.current_rentals).to include(@rental_3)
   expect(@kate.current_rentals.count).to eq(2)
   expect(@kate.past_rentals).to eq([@rental_1])
   expect(@kate.requested_rentals).to eq([@rental_5])
   expect(@kate.upcoming_rentals).to eq([@rental_4])
  end
end

end
