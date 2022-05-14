class Subreddit < ApplicationRecord
  validates :name, format: {with: /\A[a-zA-Z]+\Z/}, uniqueness: {case_sensitive: true}, presence: true
  validates :sub_description, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged
end
