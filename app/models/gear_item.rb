class GearItem < ApplicationRecord
  belongs_to :owner
  enum condition: %w(fair good perfect)
  enum status: %w(unfulfilled fulfilled)
end
