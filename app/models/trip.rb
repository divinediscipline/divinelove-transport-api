class Trip < ApplicationRecord
  has_many :bookings
  belongs_to :user
  belongs_to :bus

  validates :origin, presence: true, length: { maximum: 50 }
  validates :destination, presence: true, length: { maximum: 50 }
  validates :trip_date, presence: true
  validates :fare, presence: true, numericality: { only_integer: true }
  validates :bus_id, numericality: { only_integer: true }
end
