class ReviewsController < ApplicationController
  def index
    @reviews = Review.order(created_at: :desc).page(params[:page]).per(10)
    @tag = Tag.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      @review.save_tags(params[:review][:tag])
      flash[:notice] = "レビューを新規作成しました"
      redirect_to :reviews
    else
      render "new"
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
    @review = Review.find_by(id: params[:id])
    @review.user_id = current_user.id
    @review.destroy
    flash[:notice] = "レビューを削除しました"
    redirect_to :reviews
  end

  private

  def review_params
    params.require(:review).permit(:title, :review_1, :review_2, :review_3, :review_4, :review_5, :address, :play_day, :start_time, :result, :image, :price, :players, :friends, :timelimit, :user_id)
  end
end
