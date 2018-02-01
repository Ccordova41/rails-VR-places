class Venue < ApplicationRecord

  has_many :experiences, dependent: :destroy
  belongs_to :location

  validates :name, uniqueness: true
  validates :name, presence: true
  validates :rating, :numericality => { greater_than_or_equal_to: 1, less_than: 5 }

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

  # def highest_rated
  #   .select("venues.id, avg(comments.rating) as average_rating, count(comments.id) as number_of_comments")
  #   joins(:venues).group("venues.id").order("average_rating DESC, number_of_comments DESC")
  # end
end


# @items = Item.where(:shop_name => @shop.name).joins(:reviews)
#   .select("items.id, avg(reviews.rating) as average_rating, count(reviews.id) as number_of_reviews")
#   .group("items.id")
#   .order("average_rating DESC, number_of_reviews DESC")
