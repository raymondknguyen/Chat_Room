class Owner < ApplicationRecord
  validates :name, presence: true
  has_many :gear_items
end
