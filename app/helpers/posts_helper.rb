module PostsHelper
  def posts_any?
    if user_signed_in?
      @post = Post.find_by(user_id: current_user.id, subreddit_id: @subreddit.id)
    end
  end
end
