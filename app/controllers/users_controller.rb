class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    user.save
    
    redirect_to root_url
  end
  
  private
    def user_params
      params.require(:users).permit(:user_name, :name, :email)
    end
end
