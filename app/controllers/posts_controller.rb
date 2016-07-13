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


end
