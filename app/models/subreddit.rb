class Subreddit < ApplicationRecord
  validates :name, format: {with: /\A[a-zA-Z]+\Z/}, uniqueness: {case_sensitive: false}, presence: true
  validates :sub_description, presence: true

  validates_uniqueness_of :name, case_sensitive: true

  extend FriendlyId
  friendly_id :name, use: :slugged
end
