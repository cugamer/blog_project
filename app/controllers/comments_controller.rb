class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    if comment.save
      
    else
      # redirect_to post_path(@post)
    end
  end
  
  private
    def comment_params
      params.require(:comments).permit(:comment_text)
    end
end
