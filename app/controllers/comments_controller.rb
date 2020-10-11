class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.learner_id = current_learner.id
    @comment.post_id = @post.id
    @comment.save
    @comments = @post.comments
  end

  def destroy
    @post = Post.find(params[:post_id])
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    @comments = @post.comments
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find_by(id: params[:id], post_id: params[:post_id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find_by(id: params[:id], post_id: params[:post_id])
    respond_to do |format|
    if @comment.update(comment_params)
      format.html { redirect_to @comment }
      format.json { render 'posts/show' }
    end
  end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
