class Review < ApplicationRecord
  validates :title, :address, presence: true, length: { maximum: 50 }
  validates :play_day, presence: true
  validates :result, inclusion: { in: [true, false] }
  validates :start_time, presence: true
  validates :timelimit, presence: true
  validates :price, presence: true
  validates :players, presence: true
  validates :friends, presence: true
  validates :review_1, presence: true
  validates :image, attached: true, content_type: ['image/png', 'image/jpeg'], limit: { max: 1 }, size: { less_than: 100.megabytes , message: '100MB未満の画像にしてください' }

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_one_attached :image
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def save_tags(tags)
    tag_list = tags.split(/[[:blank:]]+/)
    current_tags = self.tags.pluck(:name)
    old_tags = current_tags - tag_list
    new_tags = tag_list - current_tags
    p current_tags
    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      self.tags << new_post_tag
    end
  end
end
