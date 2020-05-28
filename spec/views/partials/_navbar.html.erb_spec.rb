require "rails_helper"

describe "partials/_navbar" do
  let(:user) { User.first }

  context "as a visitor" do
    before do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
    end

    it "I can see a navbar at the top of the page" do
      render

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
      render

      expect(rendered).to have_link "Find Gear", href: "/"
      expect(rendered).to have_link "Log Out", href: "/logout"
      expect(rendered).to have_link "Profile", href: "/profile"
    end
  end
end
