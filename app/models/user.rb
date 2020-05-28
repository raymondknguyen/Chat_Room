class User < ApplicationRecord
  has_many :rentals
  has_many :gear_items, through: :rentals

  validates :name, presence: true
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password_digest, presence: true
  validates :street_address, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :phone_number, presence: true
  validates :age, numericality: true, presence: true

  has_secure_password

  def current_rentals
    today = DateTime.now
    rentals.where(today: start_date ..end_date)
  end

  def past_rentals
    rentals.where("end_date < ?", DateTime.now)
  end

  def upcoming_rentals
    rentals.where("start_date > ?", DateTime.now)
  end

  def requested_rentals
    rentals.includes(:item).where(item.status = "pending")
  end



end
