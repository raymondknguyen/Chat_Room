require 'rails_helper'

describe "As a user" do
  it "can log out" do
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
     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@kate)
     visit '/'
     click_link('Log Out')
     expect(page).to have_content("You are now logged out.")
     expect(current_path).to eq('/')
  end
end
