# == Schema Information
#
# Table name: subreddit_subscribers
#
#  id           :bigint           not null, primary key
#  subreddit_id :bigint           not null
#  user_id      :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class SubredditSubscriber < ApplicationRecord
  belongs_to :subreddit
  belongs_to :user
end
