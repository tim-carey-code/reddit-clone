class AddReferenceToSubscribers < ActiveRecord::Migration[7.0]
  def change
    add_reference :subscribers, :subreddit_subscriber, foreign_key: true
  end
end
