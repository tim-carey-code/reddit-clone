# == Schema Information
#
# Table name: subreddits
#
#  id              :bigint           not null, primary key
#  name            :string
#  sub_description :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  slug            :string
#  user_id         :integer
#
class Subreddit < ApplicationRecord
  validates :name, format: {with: /\A[a-zA-Z]+\Z/}, uniqueness: {case_sensitive: true}, presence: true
  validates :sub_description, presence: true

  has_many :subscriptions
  has_many :users, through: :subscriptions

  extend FriendlyId
  friendly_id :name, use: :slugged
end
