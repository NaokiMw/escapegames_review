class Review < ApplicationRecord
  validates :title, :place, presence: true, length: { maximum: 50 }
  validates :play_day, presence: true 
  validates :result, inclusion: { in: [true, false] }
  validates :start_time, presence: true

  belongs_to :user
  has_one_attached :image
end
