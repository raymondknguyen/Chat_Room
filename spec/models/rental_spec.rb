require 'rails_helper'

RSpec.describe Rental, type: :model do

  describe 'validations' do
    it {should validate_presence_of(:start_date)}
    it {should validate_presence_of(:end_date)}
  end

  describe 'relationships' do
    it {should belong_to(:user)}
    it {should belong_to(:gear_item)}
  end

end
