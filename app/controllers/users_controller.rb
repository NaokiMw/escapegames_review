class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
    @diary = @user.diaries
    @favorite_reviews = @user.favorite_reviews
  end
end
