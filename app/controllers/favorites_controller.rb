class FavoritesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @favorite = current_learner.favorites.new(post_id: @post.id)
    @favorite.save
    @post.create_notification_by(current_learner)
  end

  def destroy
  	@post = Post.find(params[:post_id])
  	@favorite = current_learner.favorites.find_by(post_id: @post.id)
  	@favorite.destroy
  end
end
