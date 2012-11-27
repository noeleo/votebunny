class SessionsController < ApplicationController

  def show
  end

  def login
    if params[:password]
      uid = User.find_by_password(params[:password])
      if uid
        session[:uid] = uid
        redirect_to home_path and return
      end
    end
    flash[:error] = "Wrong password!"
    redirect_to login_path
  end

  def destroy
    session[:uid] = nil
    flash[:notice] = "You logged out!"
  end

end
