class SubscribersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index 
  end

  def new
    @subscriber = Subscriber.new 
  end 

  def create
    @subscriber = Subscriber.new(subscriber_params)

    respond_to do |format| 
      if @subscriber.save 
        format.html { redirect_to subreddit_url(@subreddit), notice: "Successfully joined #{@subreddit.name}" }
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

