class UserCommentSerializer < ActiveModel::Serializer
  attributes :id, :comments, :user_id, :username, :experience_id
  belongs_to :experience
  belongs_to :user
end
