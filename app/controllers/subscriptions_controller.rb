class SubscriptionsController < ApplicationController
  before_action :set_subreddit, only: [:create]

  def create
    @subscription = current_user.subscriptions.new(subscription_params)

    respond_to do |format|
      if @subscription.save
        format.html { redirect_to subreddit_subscriptions_url(@subreddit), notice: "Sucessfully subscribed" }
      else
        format.html { render action: "subreddits#show", status: :unprocessable_entity }
      end
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:user_id, :subreddit_id)
  end

  def set_subreddit
    @subreddit = Subreddit.friendly.find_by(params[:id])
  end
end
