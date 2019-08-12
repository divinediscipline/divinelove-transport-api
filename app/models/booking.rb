class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  validates :user_id, presence: true
  validates :trip_id, presence: true
  validates :seat_number, presence: true, uniqueness: true, inclusion: { in: 1..14, message: "%{value} is not a valid seat number" }

end
