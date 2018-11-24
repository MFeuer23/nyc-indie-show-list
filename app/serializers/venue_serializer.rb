class VenueSerializer < ActiveModel::Serializer
  attributes :id, :name, :address
  has_many :shows
  has_many :artists
end
