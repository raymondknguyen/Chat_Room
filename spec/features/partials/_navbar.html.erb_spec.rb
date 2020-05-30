require "rails_helper"

describe "partials/_navbar" do
  before :each do
    @user =  User.create!( username: "Kayaking Kate",
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
   end

  context "as a visitor" do
    before do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
    end

    it "I can see a navbar at the top of the page" do
      visit root_path

      expect(page).to have_link "Find Gear", href: "/"
      expect(page).to have_link "Login", href: "/auth/google_oauth2"
    end
  end

  context "as a logged in user" do
    before do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it "I can see a navbar at the top of the page" do
      visit root_path

      expect(page).to have_link "Find Gear", href: "/"
      expect(page).to have_link "Log Out", href: "/logout"
      expect(page).to have_link "Profile", href: "/profile"
    end
  end
end
