class ElectionsController < ApplicationController
  before_filter :set_current_user
  before_filter :set_election, :only => :show
  before_filter :only_admin, :only => [:new, :create]

  def index
  end

  def show
  end

  def new
  end

  def create
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
end
