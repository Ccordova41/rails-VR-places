class Venue < ApplicationRecord

  has_many :experiences
  belongs_to :location
  has_many :user_venues
  has_many :users, through: :user_venues

  validates :name, uniqueness: true

  def location_attributes=(attributes_hash)
    if attributes_hash["name"].strip != ""
      attributes_hash.values.each do |attribute|
        location = Location.find_or_create_by(name: attribute)
        self.location = location
      end
    end
  end

end
