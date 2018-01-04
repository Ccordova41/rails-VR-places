class Location < ApplicationRecord
  has_many :venues

  validates :name, presence: true
  validates :name, uniqueness: true
end
