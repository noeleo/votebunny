class PositionsController < ApplicationController
  before_filter :set_current_user
  before_filter :set_election
  before_filter :set_position

  def show
  end

  def vote
    redirect_to election_path(@election.id) and return if not params[:vote]
    votes = {}
    params[:vote].each do |rank, cid|
      candidate = Candidate.find_by_id(cid)
      votes[rank.to_i] = candidate
      if not @position.candidates.include? candidate
        flash[:error] = "You can't do that!"
        redirect_to election_path(@election.id) and return
      end
    end
    if votes.values != votes.values.uniq
      flash[:error] = "You must vote for unique people!"
      redirect_to election_path(@election.id) and return
    end

    votes.each do |rank, candidate|
      Vote.vote(@user, @position, candidate, rank)
    end
    flash[:notice] = "You voted!"
    redirect_to election_path(@election.id) and return
  end
end
