class AddIndexToUserIdAndFoodIdOfUserFavoriteFoods < ActiveRecord::Migration[6.0]
  def change
    add_index :user_favorite_foods, :user_id
    add_index :user_favorite_foods, :food_id
  end
end
