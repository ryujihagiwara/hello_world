class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後の遷移先指定
  def after_sign_in_path_for(resource)
    learner_path(current_learner.id)
  end

  # ログアウト後の遷移先指定
  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :country, :learning, :native])
  end
end
