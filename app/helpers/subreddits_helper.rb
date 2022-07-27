module SubredditsHelper
  def subscribed?
    Subscription.find_by(user_id: current_user.id, subreddit_id: @subreddit.id)
  end
end
