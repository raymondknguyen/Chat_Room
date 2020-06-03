require 'rails_helper'

describe "as a visitor or user" do
  describe "when I visit the search page" do
    before(:each) do
      collin = Owner.create(name: 'Collin')
      ashley = Owner.create(name: 'Ashley')

      snowboard = GearItem.create(name: 'Snowboard', description: 'a board to snow', price: 250.5, condition: 0, status: 0, location: 'Denver, CO', owner: collin)
      bike = GearItem.create(name: 'BMX', description: 'fastest bike in town', price: 2.5, condition: 0, status: 0, location: 'Broomfield, CO', owner: collin)
      helmet = GearItem.create(name: 'Helmet', description: 'this will protect your head', price: 45.0, condition: 0, status: 0, location: 'Denver, CO', owner: collin)
      tent = GearItem.create(name: 'Tent', description: 'this tent will protect you from thunder', price: 224.5, condition: 0, status: 0, location: 'Denver, CO', owner: collin)
      purple_helmet = GearItem.create(name: 'Purple Helmet', description: 'snazzier head protection', price: 200.5, condition: 0, status: 0, location: 'Denver, CO', owner: collin)

      skates = GearItem.create(name: 'Snow Shoes', description: 'trek through the snow', price: 85.5, condition: 0, status: 0, location: 'Denver, CO', owner: ashley)
      cool_helmet = GearItem.create(name: 'Cool Helmet', description: 'helmet to protect you', price: 100.5, condition: 0, status: 0, location: 'Fort Collins, CO', owner: ashley)
      bench = GearItem.create(name: 'Bench', description: 'you sit on this', price: 95.0, condition: 0, status: 0, location: 'Denver, CO', owner: ashley)
    end

    it "I can enter a location, distance, keyword, and dates to search for matching gear to rent" do

      visit '/'

      fill_in :location, with: "Denver, CO"
      fill_in :keyword, with: "helmet"
      fill_in :distance, with: 15
      fill_in :start_date, with: "08/10/2020"
      fill_in :end_date, with: "08/15/2020"

      click_button "Search"

      expect(current_path).to eq("/search")
      expect(page).to have_content "Here are your search results:"
    end

    it "After I search I am directed to a results page that shows a map of items matching my keyword located within my preferred search location radius" do

    visit '/'

    fill_in :location, with: "Denver, CO"
    fill_in :keyword, with: "HeLmet"
    fill_in :distance, with: 15
    fill_in :start_date, with: "08/10/2020"
    fill_in :end_date, with: "08/15/2020"

    click_button "Search"

    expect(page).to have_css(".result", count: 2)

    within(first(".result")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".location")
    end

    expect(page).to have_css("#map")

    end
  end
end
