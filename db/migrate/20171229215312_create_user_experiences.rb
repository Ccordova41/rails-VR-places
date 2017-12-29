class CreateUserExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :user_experiences do |t|
      t.integer :user_id
      t.integer :experience_id

      t.timestamps null:false 
    end
  end
end
