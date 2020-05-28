require "rails_helper"

describe "partials/_navbar" do
  let(:user) { User.first }

  context "as a visitor" do
    it "I can see a navbar at the top of the page" do
      visit "/"

      expect(rendered).to have_link "Find Gear", href: "/"
      expect(rendered).to have_link "Login", href: "/login"
      expect(rendered).to have_link "Register", href: "/register"
    end
  end

  context "as a logged in user" do
    before do
      # mock current_user
      allow(view).to receive(:current_user).and_return(user)
    end

    xit "I can see a navbar at the top of the page" do
      render

      expect(rendered).to have_link "Find Gear", href: "/"
      expect(rendered).to have_link "Log Out", href: "/logout"
      expect(rendered).to have_link "Profile", href: "/profile"
    end
  end
end
