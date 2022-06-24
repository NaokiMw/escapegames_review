class AddMapToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :latitude, :float
    add_column :reviews, :longiture, :float
    rename_column :reviews, :place, :address
  end
end
