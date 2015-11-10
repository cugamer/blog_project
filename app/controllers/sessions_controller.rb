class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:sessions][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
      p "it worked================================"
    else
      flash[:danger] = "Email and password combination is incorrect"
      render 'new'
    end
  end
end
