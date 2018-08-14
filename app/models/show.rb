class Show < ApplicationRecord
  has_many :bookings
  has_many :artists, through: :bookings
  belongs_to :venue
end
