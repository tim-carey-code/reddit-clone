class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :username, uniqueness: true
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :subreddits, dependent: :delete_all
end
