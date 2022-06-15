class SubscribersController < ApplicationController
  def index
    @subscriber = Subscriber.find_by(params[:subreddit_id])
  end

  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = current_user.subscribers.new(subscriber_params)
    @subreddit = Subreddit.find_by(params[:id])

    respond_to do |format|
      if @subscriber.save
        format.html { redirect_to subreddit_path(params[:subreddit_id]), notice: "Successfully joined #{@subscriber.subreddit.name}" }
        format.json { render :show, status: :created, location: @subreddit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subreddit.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:user_id, :subreddit_id)
  end
end
