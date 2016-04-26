class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :get_current_user

  def get_current_user
    if User.exists?(session[:user_id])
      @current_user = User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def after_sign_in_path_for(user)
    flash[:notice] = "Welcome! Let's get 'er done!'"
    user_tasks_path(user)
  end
end
