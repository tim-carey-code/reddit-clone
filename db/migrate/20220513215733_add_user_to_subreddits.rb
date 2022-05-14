class AddUserToSubreddits < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :subreddits, :users
  end
end
