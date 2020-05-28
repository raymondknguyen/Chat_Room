class GearItem < ApplicationRecord
  belongs_to :owner
  has_many :rentals
  has_many :users, through: :rentals
  
  enum condition: %w(fair good perfect)
  enum status: %w(unfulfilled fulfilled)
end
