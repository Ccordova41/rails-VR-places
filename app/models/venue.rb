class Venue < ApplicationRecord

  has_many :experiences, dependent: :destroy
  belongs_to :location

  validates :name, uniqueness: true

  def location_attributes=(attributes_hash)
    if attributes_hash["name"].strip != ""
      attributes_hash.values.each do |attribute|
        location = Location.find_or_create_by(name: attribute)
        self.location = location
      end
    end
  end

  def self.best_experiences
    joins(:experiences).group(:id).order("count(*) DESC").limit(3)
  end
end
