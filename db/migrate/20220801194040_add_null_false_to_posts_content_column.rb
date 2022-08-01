class AddNullFalseToPostsContentColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :content, :text, null: false
  end
end
