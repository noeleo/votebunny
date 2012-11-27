class ElectionsController < ApplicationController
  before_filter :set_current_user
  before_filter :set_election, :except => :index

  def set_election
    @election = Election.find_by_id(params[:eid])
    redirect_to elections_path unless @user.elections.include? @election
  end

  def index
  end

  def show
  end
end
