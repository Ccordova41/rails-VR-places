class UserComment < ApplicationRecord
  belongs_to :user
  belongs_to :experience

  validates :comments, presence: true

  def username
    self.user.username
  end
end
