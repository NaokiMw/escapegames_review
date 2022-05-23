class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :username, presence: true 
  validates :profile, length: { maximum: 200 } 
  has_many :reviews
  has_many :favorites
  has_many :favorite_reviews, through: :favorites, source: :review
end
