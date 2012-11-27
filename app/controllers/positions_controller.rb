class PositionsController < ApplicationController
  before_filter :set_current_user
  before_filter :set_election, :set_position

  def show
  end

  def vote
  end
end
