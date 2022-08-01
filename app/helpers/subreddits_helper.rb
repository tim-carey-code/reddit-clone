module SubredditsHelper
  def subscribed
    if user_signed_in?
      Subscription.find_by(user_id: current_user.id, subreddit_id: @subreddit.id)
    end
  end

  def subreddit_owner?
    user_signed_in? && @subreddit.user_id == current_user.id
  end
end
