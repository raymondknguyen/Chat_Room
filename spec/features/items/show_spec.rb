require 'rails_helper'

RSpec.describe 'as a user' do
  describe 'on the items show page' do
    it 'can see a specific items and its information' do
      owner = Owner.create(name: 'owner')
      item1 = create(:random_item, owner: owner)
      item2 = create(:random_item, owner: owner)

      visit "/gear_items/#{item1.id}"

      expect(page).to have_content(item1.name)
      expect(page).to have_content(item1.description)
      expect(page).to have_content(item1.price)
      expect(page).to have_content(item1.status.capitalize)
      expect(page).to have_css("img[src*='#{item1.photo}']")
      expect(page).to_not have_content(item2.name)
    end

    it 'can has item' do
      user = User.create!( username: "Kayaking Kate",
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
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      owner = Owner.create(name: 'owner')
      item1 = create(:random_item, owner: owner)

      visit "/gear_items/#{item1.id}"

      expect(page).to have_content(item1.name)

      expect(page).to have_link('Rent Gear')
    end
  end
end
