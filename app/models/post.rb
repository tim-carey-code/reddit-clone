class Post < ApplicationRecord
  belongs_to :user
  belongs_to :subreddit

  validates :content, presence: true
  validates :title, presence: true
end
