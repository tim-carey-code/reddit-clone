class CreateSubredditSubscribers < ActiveRecord::Migration[7.0]
  def change
    create_table :subreddit_subscribers do |t|
      t.references :subreddit, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :subreddit_subscribers, [:user_id, :subreddit_id], unique: true
  end
end
