class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.learner_id = current_learner.id
    @post.save
    redirect_to posts_path
  end

  def index
  	@posts = Post.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:image, :title, :body)
  end

end
