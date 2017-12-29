class CreateExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :experiences do |t|
      t.string :title
      t.string :genre
      t.text :description
      t.integer :venue_id

      t.timestamps null:false
    end
  end
end
