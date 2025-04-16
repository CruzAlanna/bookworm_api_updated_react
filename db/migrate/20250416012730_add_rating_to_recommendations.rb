class AddRatingToRecommendations < ActiveRecord::Migration[8.0]
  def change
    add_column :recommendations, :rating, :integer
  end
end
