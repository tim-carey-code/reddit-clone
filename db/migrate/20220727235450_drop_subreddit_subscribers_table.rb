class DropSubredditSubscribersTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :subreddit_subscribers
  end
end
