class RemoveForeignKeySubscribers < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :subscribers, :subreddit_subscribers
  end
end
