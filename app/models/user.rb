# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string           not null
#
class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :username, uniqueness: true

  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :validatable

  has_many :subscriptions, dependent: :destroy
  has_many :subreddits, through: :subscriptions
  has_many :posts
  has_many :comments
end
