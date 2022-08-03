class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to subreddit_path(params[:subreddit_id]), notice: "Post made successfully" }
      else
        format.html { redirect_to subreddit_path(params[:subreddit_id]), status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @subreddit = Subreddit.friendly.find(params[:subreddit_id])
    @post = Post.find_by(subreddit_id: @subreddit.id, user_id: current_user.id)
    @post.destroy

    respond_to do |format|
      format.html { redirect_to subreddit_path(@subreddit), notice: "Post successfully destroyed" }
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id, :subreddit_id, :title)
  end
end
