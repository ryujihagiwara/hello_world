class RelationshipsController < ApplicationController

  def follow
    @learner = Learner.find(params[:id])
    current_learner.follow(params[:id])
    @learner.create_notification_follow!(current_learner)
    redirect_to request.referer
  end

  def unfollow
  	current_learner.unfollow(params[:id])
  	redirect_to request.referer
  end

  def following
  	@learner = Learner.find(params[:learner_id])
  	@followings = @learner.following_learner
  end

  def follower
  	@learner = Learner.find(params[:learner_id])
  	@followers = @learner.follower_learner
  end

end
