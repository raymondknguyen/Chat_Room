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

end
