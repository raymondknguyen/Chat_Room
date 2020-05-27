class User < ApplicationRecord
  has_many :rentals
  has_many :gear_items, through: :rentals

  validates :name, presence: true
  validates :password_digest, presence: true
  validates :street_address, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :phone_number, presence: true
  validates :age, presence: true

end
