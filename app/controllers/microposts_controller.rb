class MicropostsController < ApplicationController
  before_action :signed_in_user
  # before_action :micropost_params, only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    Micropost.find(params[:id]).delete
    redirect_to root_url
  end


  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
end