class ReviewsController < ApplicationController
  def index
    @user = current_user.id
    @reviews = Review.all
  end

  def new
    @user = current_user.id
    @review = Review.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
end
