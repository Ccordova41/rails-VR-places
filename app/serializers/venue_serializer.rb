class VenueSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :location_id
  has_many :experiences
end
