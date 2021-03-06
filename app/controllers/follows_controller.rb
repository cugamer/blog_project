class FollowsController < ApplicationController
  def create
    follow = Follow.new(user_id: current_user.id, followed_user_id: params[:id])
    if follow.save
      redirect_to User.find(current_user.id)
    else
      flash[:error] = "Oops, something went wrong.  Please try again."
    end
  end
  
  def index
    following = Follow.where(user_id: current_user.id)
    follow_ids = []
    following.map{ |fol| follow_ids << fol.followed_user_id }
    @user = current_user
    @post_feed = Post.where(user_id: follow_ids).order(created_at: :desc).paginate(:page => params[:page], :per_page => 20)
  end
  
  def destroy
    follow = Follow.find_by(followed_user_id: params[:id])

    follow.destroy if params[:id] != current_user.id
    redirect_to list_follow_posts_path
  end
end
