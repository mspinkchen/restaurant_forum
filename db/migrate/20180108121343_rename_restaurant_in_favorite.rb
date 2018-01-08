class RenameRestaurantInFavorite < ActiveRecord::Migration[5.1]
  def change
    rename_column :favorites, :retaurant_id, :restaurant_id
  end
end
