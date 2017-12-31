class Experience < ApplicationRecord

  belongs_to :venue
  has_many :experience_categories
  has_many :categories, through: :experience_categories

    def venue_name=(name)
      self.venue = Venue.find_or_create_by(name: name)
    end

    def venue_name
      if self.venue 
        self.venue 
      end
    end
end
