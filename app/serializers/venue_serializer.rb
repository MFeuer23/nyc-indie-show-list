class VenueSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :contact
  has_many :shows
  has_many :artists, through: :shows
end
