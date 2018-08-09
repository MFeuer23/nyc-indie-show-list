class Artist < ApplicationRecord
  has_secure_password
  has_many :shows
  has_many :venues, through: :shows
end
