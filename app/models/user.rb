class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :username, uniqueness: true
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
end
