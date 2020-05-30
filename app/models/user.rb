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
    rentals.where("end_date >= ? AND start_date <= ? AND status = ?", Date.today, Date.today, "approved")
  end

  def past_rentals
    rentals.where("end_date < ? AND status = ?", Date.today, "approved")
  end

  def upcoming_rentals
    rentals.where("start_date > ? AND status = ?", Date.today, "approved")
  end

  def requested_rentals
    rentals.where(status: "pending")
  end

end
