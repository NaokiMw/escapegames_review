class Review < ApplicationRecord
  validates :title, :place, presence: true, length: { maximum: 50 }
  validates :play_day, presence: true 
  validates :result, inclusion: { in: [true, false] }
  validates :start_time, presence: true

  belongs_to :user
  has_many :favorites
  has_one_attached :image
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  def self.looks(search, word)
    if search == "perfect_match"
      @review = Review.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @review = Review.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @review = Review.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @review = Review.where("title LIKE?","%#{word}%")
    else
      @review = Review.all
    end
  end
end
