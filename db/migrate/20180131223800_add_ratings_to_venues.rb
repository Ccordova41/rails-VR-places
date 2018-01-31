class AddRatingsToVenues < ActiveRecord::Migration[5.1]
  def change
    add_column :venues, :rating, :integer
  end
end
