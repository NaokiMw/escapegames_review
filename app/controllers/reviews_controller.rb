class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:notice] = "レビューを新規作成しました"
      redirect_to :reviews
    else
      render"new"
    end
  end

  def show
    @user = current_user.id
    @review = Review.where(user_id: @user)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def review_params
    params.require(:review).permit(:title, :review_1, :review_2, :review_3, :review_4, :review_5, :place, :play_day, :start_time, :result, :image, :user_id)
  end
end
