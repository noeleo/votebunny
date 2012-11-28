class Vote < ActiveRecord::Base
  attr_accessible :user, :position, :rank, :candidate

  belongs_to :user
  belongs_to :position
  belongs_to :candidate

  # vote for a candidate for a position
  # assumes correct input is being passed
  def self.vote(user, position, candidate, rank)
    begin
      Vote.create!(:user => user, :position => position, :candidate => candidate, :rank => rank)
    rescue
      v = Vote.where("user_id = ? AND position_id = ? AND rank = ?", user.id, position.id, rank).limit(1).first
      v.candidate = candidate
      v.save
    end
  end

end
