require 'rails_helper'

RSpec.describe GearItem, type: :model do

  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:description)}
    it {should define_enum_for(:status) }
    it {should define_enum_for(:condition) }
    it {should validate_presence_of(:location)}
    it {should validate_numericality_of(:price)}

  end

  describe 'relationships' do
    it {should belong_to(:owner)}
    it {should have_many(:rentals)}
    it {should have_many(:users).through(:rentals)}
  end

  describe 'class methods' do
    it '.find_matches' do
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

      query_params = {keyword: "helmet"}

      expect(GearItem.find_matches(query_params)).to eq([helmet, purple_helmet, cool_helmet])
    end
  end
end
