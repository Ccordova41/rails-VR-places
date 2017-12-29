class AddCommentToUserExperiences < ActiveRecord::Migration[5.1]
  def change
    add_column :user_experiences, :comments, :text
  end
end
