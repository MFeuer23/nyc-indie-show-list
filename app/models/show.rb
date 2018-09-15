class Show < ApplicationRecord
  belongs_to :artist
  belongs_to :venue


  accepts_nested_attributes_for :venue, reject_if: :venue_invalid
  validates :date, presence: true
  validates :venue, presence: true

  def self.upcoming(show_array)
    show_array.select { |show| show.date >= Date.today }
  end

  def self.past(show_array)
    show_array.select { |show| show.date < Date.today }
  end
end
