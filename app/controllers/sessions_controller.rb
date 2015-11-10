class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:sessions][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = "Email and password combination is incorrect"
      render 'new'
    end
  end
end
