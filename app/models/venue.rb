class Venue < ApplicationRecord
  has_many :shows
  has_many :artists, through: :shows

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  validates :address, presence: true
end
