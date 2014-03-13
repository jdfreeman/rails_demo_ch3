class MicropostsController < ApplicationController
  before_action :signed_in_user
  # before_action :micropost_params, only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)

    if @microposts.save
      flash[:success] = "Created a new micropost"
      redirect_to root_url
    else
      render 'static_pages/home'
    end

  end

  def destroy
  end


  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
end