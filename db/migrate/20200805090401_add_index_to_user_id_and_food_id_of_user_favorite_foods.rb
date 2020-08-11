class AddIndexToUserIdAndFoodIdOfUserFavoriteFoods < ActiveRecord::Migration[6.0]
  def change
    change_table :user_favorite_foods, bulk: true do |t|
      t.index :user_id
      t.index :food_id
    end
  end
end
