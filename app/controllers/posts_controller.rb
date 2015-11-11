class PostsController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = current_user
    post = @user.posts.new(post_params)
    if post.save
      
    else
      flash.now[:errors] = post.errors.full_messages
      render new_post_path
    end
  end
  
  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
