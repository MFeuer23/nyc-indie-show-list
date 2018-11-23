class ShowSerializer < ActiveModel::Serializer
  attributes :id, :date, :info
  belongs_to :artist
  belongs_to :venue
end
