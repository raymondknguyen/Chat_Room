require 'rails_helper'

RSpec.describe 'as a user' do
  describe 'on the room page' do 
    it 'can send message' do
      user = create(:regular_user) 
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/rooms'

      fill_in 'room_name', with: 'room1'
      click_on 'New Message'

      room = Room.last

      within('.col-4') do
        expect(page).to have_content(room.name.capitalize)
      end

      fill_in 'message_content', with: 'hello'
      expect(page).to have_button('chat-btn')

      click_on 'Delete'

      expect(page).to_not have_content('room1')
    end
  end
end