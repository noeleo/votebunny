class ElectionsController < ApplicationController
  before_filter :set_current_user
  before_filter :set_election, :except => :index

  def index
  end

  def show
  end
end
