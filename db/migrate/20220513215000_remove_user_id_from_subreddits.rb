class RemoveUserIdFromSubreddits < ActiveRecord::Migration[7.0]
  def change
    remove_column :subreddits, :user_id
  end
end
