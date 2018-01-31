class VenueSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :rating, :location_id
  has_many :experiences
end
