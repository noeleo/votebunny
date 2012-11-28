class PositionsController < ApplicationController
  before_filter :set_current_user
  before_filter :set_election, :set_position

  def show
  end

  def vote
    candidate = Candidate.find_by_id(params[:cid])
    if @position.candidates.include? candidate
      Vote.vote(@user, @position, candidate)
    else
      flash[:error] = "You can't do that!"
    end
    redirect_to election_path(@election.id) and return
  end
end
