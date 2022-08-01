require "test_helper"

class SubredditSubscribeTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @subreddit = subreddits(:one)
    @user = users(:tim)
  end

  test "should subscribe to subreddit" do
    sign_in @user
    get subreddit_url(@subreddit)
    assert_difference "Subscription.count", 1 do
      post subreddit_subscriptions_url(@subreddit),
        params: {subscription: {user_id: @user.id, subreddit_id: @subreddit.id}}
    end
    assert_redirected_to subreddit_url(@subreddit)
  end
end
