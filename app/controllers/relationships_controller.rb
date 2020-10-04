class RelationshipsController < ApplicationController

  def follow
    current_learner.follow(params[:id])
    redirect_to request.referer
  end

  def unfollow
  	current_learner.unfollow(params[:id])
  	redirect_to request.referer
  end

end
