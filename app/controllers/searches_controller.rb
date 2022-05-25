class SearchesController < ApplicationController
  def search
    @range = params[:range]
    @reviews = Review.looks(params[:search], params[:word])
  end
end
