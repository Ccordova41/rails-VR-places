class UserExperience < ApplicationRecord
  belongs_to :user
  belongs_to :experience

  validates :name, presence: true
  validates :name, uniqueness: true
end
