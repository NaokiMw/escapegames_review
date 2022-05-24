class Diary < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :play_day, presence: true 
  validates :result, inclusion: { in: [true, false] }
  validates :start_time, presence: true
  validates :description, length: { maximum: 2000 } 
  belongs_to :user
  enum status: { draft: 0, published: 1 }
end
