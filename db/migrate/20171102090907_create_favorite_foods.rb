class CreateFavoriteFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :user_favorite_foods do |t|
      t.integer :user_id
      t.integer :food_id

      t.timestamps
    end
  end
end
