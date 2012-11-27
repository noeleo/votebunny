class ApplicationController < ActionController::Base
  protect_from_forgery

  def set_current_user
    # find_by_id(nil) returns nil
    @user ||= User.find_by_id(session[:user_id])
    redirect_to login_path and return unless @user
  end

end
