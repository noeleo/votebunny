class ElectionsController < ApplicationController
  before_filter :set_current_user
  before_filter :set_election, :only => :show

  def index
  end

  def show
    @votes = {}
    @election.positions.each do |position|
      num_ranks = [3,position.candidates.count].min
      vote = ""
      1.upto(num_ranks) do |rank|
        v = position.votes.where("user_id = ? AND rank = ?", @user.id, rank).first
        vote += rank.to_s + ". " + v.candidate.name + "  " if v
      end
      @votes[position] = vote
    end
  end
end
