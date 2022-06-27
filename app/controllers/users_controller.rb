class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.order(created_at: :desc).limit(10)
    @diary = @user.diaries.order(created_at: :desc).limit(10)
    @favorite_reviews = @user.favorite_reviews.order(created_at: :desc)
    followings = current_user.followings
    @follow_reviews = Review.where(user: followings).order(created_at: :desc).limit(10)
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
