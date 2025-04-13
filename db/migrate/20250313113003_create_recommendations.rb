class CreateRecommendations < ActiveRecord::Migration[8.0]
  def change
    create_table :recommendations do |t|
      t.string :title
      t.string :author
      t.string :review

      t.timestamps
    end
  end
end
