class UserComment < ApplicationRecord
  belongs_to :user
  belongs_to :artwork

  validates :comments, presence: true

  def username
    self.user.username

end
