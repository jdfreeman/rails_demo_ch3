class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)

    if user && user.authenticate(params[:password])
      flash[:success] = "Logged In Successfully!"
      sign_in user
      redirect_back_or user
    else
      flash[:error] = "Email or password invalid"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end