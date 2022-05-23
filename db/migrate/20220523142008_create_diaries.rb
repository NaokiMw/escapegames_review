class CreateDiaries < ActiveRecord::Migration[6.1]
  def change
    create_table :diaries do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.date :play_day
      t.time :start_time
      t.boolean :result
      t.boolean :status

      t.timestamps
    end
  end
end
