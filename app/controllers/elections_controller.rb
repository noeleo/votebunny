class ElectionsController < ApplicationController
  before_filter :set_current_user
  before_filter :set_election, :only => :show

  def index
  end

  def show
  end
end
