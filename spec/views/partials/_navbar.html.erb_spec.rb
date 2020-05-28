require "rails_helper"

describe "partials/_navbar" do
  context "as a visitor" do
    it "I can see a navbar at the top of the page" do
      render

      expect(rendered).to have_link "Find Gear"
      expect(rendered).to have_link "Login"
      expect(rendered).to have_link "Register"
      # TODO: need to test that the actual links have the right hrefs
    end
  end

  context "as a logged in user" do
    it "I can see a navbar at the top of the page" do
      # TODO: set the current user here

      render

      expect(rendered).to have_link "Find Gear"
      expect(rendered).to have_link "Log Out"
      expect(rendered).to have_link "Profile"
      # TODO: need to test that the actual links have the right hrefs
    end
  end
end
