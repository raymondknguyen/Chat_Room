require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    it { should validate_uniqueness_of(:username).case_insensitive
                                                  .with_message("already has an account associated with it")}

    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:password)}
    it {should validate_presence_of(:street_address)}
    it {should validate_presence_of(:state)}
    it {should validate_presence_of(:zip)}
    it {should validate_presence_of(:phone_number)}
    it {should validate_numericality_of(:age)}

  end

  describe 'relationships' do
    it {should have_many(:rentals)}
    it {should have_many(:gear_items).through(:rentals)}
  end

end
