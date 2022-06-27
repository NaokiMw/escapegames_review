class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.build(review_id: params[:review_id])
    favorite.save
    redirect_to reviews_path
  end

  def destroy
    favorite = Favorite.find_by(review_id: params[:review_id], user_id: current_user.id)
    favorite.destroy
    redirect_to reviews_path
  end
end
