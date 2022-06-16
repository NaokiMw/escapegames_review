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
    @review = Review.where(id: params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @review = Review.find_by(params[:id])
    @review.user_id = current_user.id
    @review.destroy
    flash[:notice] = "レビューを削除しました"
    redirect_to :reviews
  end

  private
  def review_params
    params.require(:review).permit(:title, :review_1, :review_2, :review_3, :review_4, :review_5, :place, :play_day, :start_time, :result, :image, :user_id)
  end
end
