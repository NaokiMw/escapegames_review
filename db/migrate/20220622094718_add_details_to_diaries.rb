class AddDetailsToDiaries < ActiveRecord::Migration[6.1]
  def change
    add_column :diaries, :timelimit, :integer
    add_column :diaries, :price, :integer
    add_column :diaries, :players, :integer
    add_column :diaries, :friends, :integer
    add_column :diaries, :image, :string
  end
end
