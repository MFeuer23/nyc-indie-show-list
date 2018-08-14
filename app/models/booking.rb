class Booking < ApplicationRecord
  belongs_to :artist
  belongs_to :show
end
