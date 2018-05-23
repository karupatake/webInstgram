class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true

  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_secure_password
  has_many :comments

  validates :email, length: {maximum:5}
  validates :email, uniqueness: true
  validates :password, length: {maximum:5}

end
