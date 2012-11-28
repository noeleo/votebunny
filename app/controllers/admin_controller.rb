class AdminController < ApplicationController
  before_filter :set_current_user, :only_admin
  before_filter :set_election, :only => [:new_position, :create_position]

  def new_election
  end

  def new_position
  end

  def create_election
    e = Election.new(params[:election])
    if e.save
      @user.elections << e
      flash[:notice] = "New election created!"
      redirect_to election_path(e.id) and return
    else
      flash[:error] = "Whoops, coudln't create a new election!"
      redirect_to new_election_path and return
    end
  end

  def create_position
    p = Position.new(params[:position])
    p.election = @election
    if p.save
      flash[:notice] = "New position created!"
      redirect_to election_path(@election.id) and return
    else
      flash[:error] = "Whoops, couldn't create a new position!"
      redirect_to new_position_path and return
    end
  end

end
