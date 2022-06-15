class CreateSubscribers < ActiveRecord::Migration[7.0]
  def change
    create_table :subscribers do |t|
      t.timestamps
      t.references :user, index: true
      t.references :subreddit, index: true
    end
  end
end
