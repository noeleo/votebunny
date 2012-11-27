class SessionsController < ApplicationController

  def show
    # if already logged in, don't show login page
    redirect_to elections_path and return if logged_in?
  end

  def login
    if params[:password]
      uid = User.find_by_password(params[:password])
      if uid
        session[:user_id] = uid
        redirect_to home_path and return
      end
    end
    flash[:error] = "Wrong password!"
    redirect_to login_path
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You logged out!"
  end

end
