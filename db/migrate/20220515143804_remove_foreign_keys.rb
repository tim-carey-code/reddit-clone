class RemoveForeignKeys < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :subreddit_subscribers, :subreddits
    remove_foreign_key :subreddit_subscribers, :users
  end
end
