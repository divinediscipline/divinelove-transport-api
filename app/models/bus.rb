class Bus < ApplicationRecord
  belongs_to :user
  has_one :trip
end
