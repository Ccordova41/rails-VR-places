class Location < ApplicationRecord
  has_many :venues, dependent: :destroy;

  validates :name, presence: true
  validates :name, uniqueness: true
end
