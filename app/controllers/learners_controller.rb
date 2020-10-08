class LearnersController < ApplicationController

  before_action :authenticate_learner!, except: [:index]

  def index
  	@learners = Learner.all
  end

  def show
  	@learner = Learner.find(params[:id])
  end

  def edit
    @learner = Learner.find(params[:id])
    if @learner == current_learner
    else
      redirect_to learner_path(current_learner)
    end
  end

  def update
  	@learner = current_learner
  	if @learner.update(learner_params)
  	   redirect_to learner_path(@learner), notice: "Account information was updated!"
  	else
  	   render 'edit'
  	end
  end

  private

  def learner_params
  	params.require(:learner).permit(:nickname, :profile_image, :introduction, :country, :learning, :native)
  end


end
