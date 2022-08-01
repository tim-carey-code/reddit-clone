class SubredditsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_subreddit, only: %i[show edit update destroy]
  load_and_authorize_resource

  def index
    @subreddits = Subreddit.all.order(created_at: :desc)
  end

  def show
    @subscription = @subreddit.subscriptions.new
  end

  def new
    @subreddit = Subreddit.new
  end

  def edit
  end

  def create
    @subreddit = current_user.subreddits.build(subreddit_params)

    respond_to do |format|
      if @subreddit.save
        format.html do
          redirect_to subreddit_url(@subreddit),
            notice: "#{@subreddit.name} was successfully created."
        end
        format.json { render :show, status: :created, location: @subreddit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json do
          render json: @subreddit.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @subreddit.update(subreddit_params)
        format.html do
          redirect_to subreddit_url(@subreddit),
            notice: "#{@subreddit.name} was successfully updated."
        end
        format.json { render :show, status: :ok, location: @subreddit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @subreddit.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @subreddit.destroy

    respond_to do |format|
      format.html do
        redirect_to subreddits_url,
          notice: "#{@subreddit.name} was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private

  def set_subreddit
    @subreddit = Subreddit.friendly.find(params[:id])
  end

  def subreddit_params
    params.require(:subreddit).permit(:name, :sub_description, :user_id)
  end
end
