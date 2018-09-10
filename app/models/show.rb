class Show < ApplicationRecord
  belongs_to :artist
  belongs_to :venue


  accepts_nested_attributes_for :venue, reject_if: :venue_invalid
  validates :date, presence: true
  validates :venue, presence: true

  private
    def invalid_venue(attributes)
      binding.pry
    end
end
