class LearnersController < ApplicationController

  def index
  	@learners = Learner.all
  end

  def show
  	@learner = Learner.find(params[:id])
  end

  def edit
    @learner = current_learner
  end

  def update
  	@learner = current_learner
  	if @learner.update(learner_params)
  	   redirect_to learner_path(@learner)

  end

  private

  def learner_params
  	params.require(:learner).permit(:nickname, :profile_image, :introduction, :country, :learning, :native)
  end


end
