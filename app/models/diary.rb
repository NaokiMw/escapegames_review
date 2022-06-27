class Diary < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :play_day, presence: true
  validates :result, inclusion: { in: [true, false] }
  validates :start_time, presence: true
  validates :description, length: { maximum: 2000 }
  validates :timelimit, presence: true
  validates :price, presence: true
  validates :players, presence: true
  validates :friends, presence: true
  validates :image, content_type: ['image/png', 'image/jpeg'], limit: { max: 1 }, size: { less_than: 100.megabytes , message: '100MB未満の画像にしてください' }

  belongs_to :user
  has_one_attached :image
  enum status: { draft: false, published: true }
end
