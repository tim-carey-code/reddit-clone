class AddUserIdToSubreddits < ActiveRecord::Migration[7.0]
  def change
    add_column :subreddits, :user_id, :integer
  end
end
