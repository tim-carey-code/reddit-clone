# == Schema Information
#
# Table name: subscribers
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Subscriber < ApplicationRecord
  has_many :subreddit_subscribers
  has_many :subreddits, through: :subreddit_subscribers
end
