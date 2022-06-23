class RenameLongitureColumnToReviews < ActiveRecord::Migration[6.1]
  def change
    rename_column :reviews, :longiture, :longitude
  end
end
