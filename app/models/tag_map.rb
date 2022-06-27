class TagMap < ApplicationRecord
  validates :review_id, presence: true
  validates :tag_id, presence: true
  belongs_to :review
  belongs_to :tag
end
