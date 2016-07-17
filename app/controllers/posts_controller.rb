class PostsController < ApplicationController
  skip_after_action :verify_authorized, only: [:vote]

  def index
    @posts = current_user.posts
  end

  def show
    @post = Post.find params[:id]
    @comments = @post.comments.includes(:user)
  end

  def new
    @post = current_user.posts.new
  end

  def create
    user = current_user
    post = user.posts.new title: params[:post][:title], content: params[:post][:content], subcheckit_id: params[:subcheckit_id]
    post.save
    redirect_to subcheckits_path
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    post = Post.find params[:id]
    if post.update approved_params
      flash[:notice] = "You have updated this post"
      redirect_to subcheckit_path(params[:subcheckit_id])
    else
      render subcheckit_path params[:subcheckit_id]
    end

  end

  def vote
    vote = current_user.votes.find_by(post_id: params[:post_id])
    if vote
      vote_update vote: vote, value: params[:vote]
    else
      vote_create params: params[:vote], post_id: params[:post_id]
    end

    respond_to do |format|
      format.html { redirect_to :back}
      format.json { render json: { status: :ok, post: post}}
    end

  end

  def score
    post = Post.find params[:post_id]

    respond_to do |format|
      format.html { redirect_to :back}
      format.json { render json: { status: :ok, score: post.vote_total}}
    end

  end

  private

    def approved_params
      params.require(:post).permit(:title, :content)
    end

    def vote_update vote: vote, value: value
      case value
      when "up"
        vote.update(vote: 1)
      when "down"
        vote.update(vote: -1)
      end
    end

    def vote_create params: params, post_id: post_id
      case params
      when "up"
        Vote.create(user_id: current_user.id, post_id: post_id, vote: 1)
      when "down"
        Vote.create(user_id: current_user.id, post_id: post_id, vote: -1)
      end#
    end

end
