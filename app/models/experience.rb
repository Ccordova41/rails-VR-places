class Experience < ApplicationRecord

  belongs_to :venue
  has_many :experience_categories
  has_many :categories, through: :experience_categories
  
end
