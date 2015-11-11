class PostsController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
  new
end
