module PermissionsHelper
  def logged_in_user
    unless logged_in?
      flash[:errors] = ["Please log in to access this function"]
      redirect_to login_url
    end
  end
    
  def correct_user
    post = Post.find(params[:id])
    @user = User.find(post.user_id)
    redirect_to(root_url) unless @user == current_user
  end
  
  def authorized_user?(page_owner_user_id)
    current_user.id.to_s == page_owner_user_id.to_s
  end
end