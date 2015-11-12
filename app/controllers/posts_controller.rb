class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy, :edit, :update]
  before_action :correct_user,   only: [:new, :create, :destroy, :edit, :update]
  
  def index
  end
  
  def user_posts
    @user = User.find(params[:id])
    @user_posts = @user.posts.paginate(:page => params[:page], :per_page => 5)
    @following = Follow.where(user_id: current_user.id, followed_user_id: @user.id).exists?
    @self = current_user.id == @user.id
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = current_user
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to @post
    else
      flash.now[:errors] = @post.errors.full_messages
      render new_post_path
    end
  end
  
  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    @following = Follow.where(user_id: current_user.id, followed_user_id: @user.id).exists?
    
    p "------------------------------------"
    @comments = @post.comments
    p @comments.class
    @self = current_user.id == @user.id
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_posts_path(current_user[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post.attributes = post_params
    if @post.save
      redirect_to @post
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to edit_post_path
    end
    
  end
  
  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
