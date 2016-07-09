class SubcheckitsController < ApplicationController
  skip_after_action :verify_authorized, only: [:index]

  def index
    @subcheckits = Subcheckit.all
  end

  def show

  end

  def new
    @subcheckit = Subcheckit.new
    @user = current_user
  end

  def create
    @subcheckit= Subcheckit.new approved_params
    @subcheckit.created_by = current_user.id
    if @subcheckit.save
      flash[:notice] = "SubCheckit has been created"
      redirect_to subcheckits_path
    else
      render :index
    end
  end

  private

    def approved_params
      params.require(:subcheckit).permit(:name, :category)
    end
end
