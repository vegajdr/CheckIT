class SubcheckitsController < ApplicationController
  skip_after_action :verify_authorized, only: [:index]

  def index
    @subcheckits = Subcheckit.all
  end

  def show
    @subcheckit = Subcheckit.find params[:id]
    @posts = @subcheckit.posts.includes(:user)
  end

  def new
    @subcheckit = Subcheckit.new
    @user = current_user
  end

  def create
    @subcheckit= Subcheckit.new approved_params
    @subcheckit.created_by = current_user.id
    if @subcheckit.save
      @subcheckit.moderators.create! user_id: current_user.id
      flash[:notice] = "SubCheckit has been created, you are now a moderator for this channel"
      redirect_to subcheckit_path @subcheckit
    else
      render :index
    end
  end

  def edit
    @subcheckit = Subcheckit.find params[:id]
  end

  def update
    subcheckit = Subcheckit.find params[:id]
    if subcheckit.update approved_params
      flash[:notice] = "Subcheckit updated"
      redirect_to subcheckits_path
    else
      render :edit
    end
  end

  def destroy
    subcheckit = Subcheckit.find params[:id]
    subcheckit.destroy
    redirect_to subcheckits_path
  end

  private

    def approved_params
      params.require(:subcheckit).permit(:name, :category)
    end
end
