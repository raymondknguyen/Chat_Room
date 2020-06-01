require 'rails_helper'

describe 'As a user' do
  it 'can add info to my profile' do
    @kate = User.create!(  name: "Kate Smith",
                           email: "kate@example.com")
                           # street_address: "123 Mulberry Street",
                           # state: "CO",
                           # zip: "80303",
                           # profile_picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQDNCFOXFv30vvRl4plrMuwCltmT5m4TzAtszYfm8XrLP7PLgKH&usqp=CAU",
                           # phone_number: "(123) 456-7891",
                           # age: "25",
                           # about_me: "I love travelling and going on adventures with my favorite side-kick -- my dog, Jack."

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@kate)
    visit('/profile')
    expect(page).to have_link("Edit my profile")
    click_on("Edit my profile")
    expect(current_path).to eq('/profile/edit')
    fill_in :profile_picture, with: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQDNCFOXFv30vvRl4plrMuwCltmT5m4TzAtszYfm8XrLP7PLgKH&usqp=CAU"
    fill_in :about_me, with: "I love travelling and going on adventures with my favorite side-kick -- my dog, Jack."
    fill_in :age, with: 30
    click_on("Save")
    expect(current_path).to eq('/profile')
    @kate.reload
    expect(page).to have_content(@kate.about_me)
    expect(page).to have_css("img[src*='#{@kate.profile_picture}']")
  end
end
