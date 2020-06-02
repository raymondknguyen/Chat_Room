require 'rails_helper'

RSpec.describe Room, type: :model do
  it {should have_many(:messages)}
end
