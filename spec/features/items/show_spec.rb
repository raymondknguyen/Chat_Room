require 'rails_helper'

RSpec.describe 'as a user' do
  describe 'on the items show page' do
    it 'can see a specific items and its information' do
      owner = Owner.create(name: 'owner')
      item1 = create(:random_item, owner: owner)
      item2 = create(:random_item, owner: owner)

      visit "/gear_items/#{item1.id}"

      expect(page).to have_content(item1.name)
      expect(page).to have_content(item1.description)
      expect(page).to have_content(item1.price)
      expect(page).to have_content(item1.status)
      expect(page).to_not have_content(item2.name)
    end

    it 'can has item' do
      owner = Owner.create(name: 'owner')
      item1 = create(:random_item, owner: owner)

      visit "/gear_items/#{item1.id}"
      
      expect(page).to have_content(item1.name)

      expect(page).to have_link('Rent Gear')
    end
  end
end