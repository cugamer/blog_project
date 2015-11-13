class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    if !comment.save
      flash[:errors] = comment.errors.full_messages
    end
    redirect_to post_path(comment_params[:post_id])
  end
  
  def destroy
    comment = Comment.find(params[:id])
    post = Post.find(comment.post_id)
    comment.destroy
    redirect_to post_path(post.id)
  end
  
  def edit
    comment = Comment.find(params[:id])
    comment.comment_text = comment_params[:comment_text]
    if !comment.save
      flash[:errors] = comment.errors.full_messages
    end
    
    comment.save
    redirect_to post_path(comment_params[:post_id])
  end
  
  private
    def comment_params
      params.require(:comment).permit(:comment_text, :post_id)
    end
end
