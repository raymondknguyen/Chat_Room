class GearItem < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :price, numericality: true
  validates :condition, presence: true

  belongs_to :owner
  has_many :rentals
  has_many :users, through: :rentals

  enum condition: %w(fair good perfect)
  enum status: %w(available pending rented)

  def self.find_matches(query_params)
    GearItem.where("lower(name) LIKE?", "%#{query_params[:keyword]}%")
  end

end
