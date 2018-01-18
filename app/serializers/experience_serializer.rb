class ExperienceSerializer < ActiveModel::Serializer
  attributes :id, :title, :genre, :description
  belongs_to :venue
  has_many :user_comments
  has_many :categories
end
