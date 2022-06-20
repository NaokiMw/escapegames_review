class AddColumnReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :price, :integer

    add_column :reviews, :timelimit, :integer

    add_column :reviews, :players, :integer

    add_column :reviews, :friends, :integer
  end
end
