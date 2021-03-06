class ApplicationController < ActionController::Base
  protect_from_forgery

  def set_current_user
    # find_by_id(nil) returns nil
    @user ||= User.find_by_id(session[:user_id])
    redirect_to login_path and return unless @user
  end

  def set_election
    @election = Election.find_by_id(params[:eid])
    redirect_to elections_path unless @user.elections.include? @election
  end

  def set_position
    @position = Position.find_by_id(params[:pid])
    redirect_to elections_path unless @election.positions.include? @position
  end

  def only_admin
    if not @user.is_admin
      flash[:error] = "You have to be an admin to do that!"
      redirect_to elections_path and return
    end
  end
end
