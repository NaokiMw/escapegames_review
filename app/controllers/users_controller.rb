class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
    @diary = @user.diaries.limit(5)
    @favorite_reviews = @user.favorite_reviews
    followings = current_user.followings
    @follow_reviews = Review.where(user: followings).order(:created_time).limit(10)
  end
  def mypage
    redirect_to user_path(current_user)
  end
  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end
end
