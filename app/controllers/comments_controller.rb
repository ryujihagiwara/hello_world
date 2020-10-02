class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.learner_id = current_learner.id
    @comment.post_id = @post.id
    @comment.save
  end

  def edit
  end

  def update
  end

  def destroy
    @post = Post.find(params[:post_id])
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
