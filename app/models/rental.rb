class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :gear_item
end
