class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passengers
  accepts_nested_attributes_for :passengers

  validates :passenger_id, presence: true
  validates :flight_id, presence: true
end
