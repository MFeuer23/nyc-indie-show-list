class VenueSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :shows
  has_many :artists
end
