class Category < ApplicationRecord

  has_many :experience_categories
  has_many :experiences, through: :experience_categories
end
