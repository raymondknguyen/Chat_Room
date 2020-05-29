require "rails_helper"

describe "partials/_navbar" do
  let(:user) { User.create!( username: "Kayaking Kate",
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
                       )}

  context "as a visitor" do
    before do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
    end

    it "I can see a navbar at the top of the page" do
      render partial: "partials/navbar.html.erb"

      expect(rendered).to have_link "Find Gear", href: "/"
      expect(rendered).to have_link "Login", href: "/login"
      expect(rendered).to have_link "Register", href: "/register"
    end
  end

  context "as a logged in user" do
    before do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it "I can see a navbar at the top of the page" do
      render partial: "partials/navbar.html.erb"

      expect(rendered).to have_link "Find Gear", href: "/"
      expect(rendered).to have_link "Log Out", href: "/logout"
      expect(rendered).to have_link "Profile", href: "/profile"
    end
  end
end
