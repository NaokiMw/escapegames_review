class ChangeDatatypeReview1OfReviews < ActiveRecord::Migration[6.1]
  def change
    change_column :reviews, :review_2, :string
    change_column :reviews, :review_3, :string
    change_column :reviews, :review_4, :string
    change_column :reviews, :review_5, :string
  end
end
