class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.learner_id = current_learner.id
    if @post.save
       redirect_to posts_path
    else
       render 'new'
    end
  end

  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.update(post_params)
  	   redirect_to post_path
  	else
  	   render 'edit'
  	end
  end

  def destroy
  	@post =Post.find(params[:id])
  	@post.destroy
  	redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:image, :title, :body, :genre)
  end

end
