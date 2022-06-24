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
  belongs_to :user
  has_one_attached :image
  enum status: { draft: false, published: true }
end
