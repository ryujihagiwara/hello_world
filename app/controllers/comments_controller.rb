class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:id])
    @comment = current_learner.comments.new(comment_params)
    @comment.post_id = @post.id
    @comment.save
    redirect_to request.referer
  end

  def edit
  end

  def update
  end

  def destroy
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
