class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.float :review_1
      t.float :review_2
      t.float :review_3
      t.float :review_4
      t.float :review_5
      t.string :place
      t.date :play_day
      t.time :start_time
      t.boolean :result
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
