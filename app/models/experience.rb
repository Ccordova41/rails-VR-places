class Experience < ApplicationRecord

  belongs_to :venue
  has_many :experience_categories
  has_many :categories, through: :experience_categories

  has_many :user_experiences, dependent: :destroy
  has_many :users, through: :user_experiences

  has_many :user_comments, dependent: :destroy
  has_many :comments, through: :user_comments


  validates :title, presence: true
  validates :title, uniqueness: true

    def venue_name=(name)
      self.venue = Venue.find_or_create_by(name: name)
    end

    def venue_name
      if self.venue
        self.venue
      end
    end

    def categories_attributes=(attributes_hash)
  if attributes_hash["0"]["name"].strip != ""
    attributes_hash.values.each do |attribute|
      category = Category.find_or_create_by(attribute)
      self.categories << category
    end
  end
end

end
