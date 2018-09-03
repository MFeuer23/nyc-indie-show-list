class Venue < ApplicationRecord
  has_many :shows
  has_many :artists, through: :shows

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
end
