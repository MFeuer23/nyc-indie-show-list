class ShowSerializer < ActiveModel::Serializer
  attributes :id, :date, :info, :venue_id
  belongs_to :artist
  belongs_to :venue
end
