require 'rails_helper'

describe "as a visitor or user" do
  describe "when I visit the search page" do
    before(:each) do
      collin = Owner.create(name: 'Collin')
      ashley = Owner.create(name: 'Ashley')

      snowboard = GearItem.create(name: 'Snowboard', description: 'a board to snow', price: 250.5, condition: 0, status: 0, location: '80204', owner: collin)
      bike = GearItem.create(name: 'BMX', description: 'fastest bike in town', price: 2.5, condition: 0, status: 0, location: '80019', owner: collin)
      helmet = GearItem.create(name: 'Helmet', description: 'this will protect your head', price: 45.0, condition: 0, status: 0, location: '80203', owner: collin)
      tent = GearItem.create(name: 'Tent', description: 'this tent will protect you from thunder', price: 224.5, condition: 0, status: 0, location: '38655', owner: collin)
      camper = GearItem.create(name: 'Purple Helmet', description: 'snazzier head protection', price: 200.5, condition: 0, status: 0, location: '80222', owner: collin)

      skates = GearItem.create(name: 'Snow Shoes', description: 'trek through the snow', price: 85.5, condition: 0, status: 0, location: '38655', owner: ashley)
      ski = GearItem.create(name: 'Helmet', description: 'helmet to protect you', price: 100.5, condition: 0, status: 0, location: '40403', owner: ashley)
      bench = GearItem.create(name: 'Bench', description: 'you sit on this', price: 95.0, condition: 0, status: 0, location: '80227', owner: ashley)
    end

    it "I can enter a location, keywords, and dates to search for matching gear to rent" do

      visit '/'

      fill_in :location, with: "Denver, CO"
      fill_in :keywords, with: "helmet, snow"
      fill_in :start_date, with: "08/10/2020"
      fill_in :end_date, with: "08/15/2020"

      click_button "Search"

      expect(current_path).to eq("/search_results")
      expect(page).to have_content "Here are your search results:"

    end
  end
end
