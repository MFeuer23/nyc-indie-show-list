class Venue < ApplicationRecord
  has_many :shows
  has_many :artists, through: :shows
end
