class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage]
  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
    @diary = @user.diaries
    @favorite_reviews = @user.favorite_reviews
  end
  def mypage
    redirect_to user_path(current_user)
  end
end
