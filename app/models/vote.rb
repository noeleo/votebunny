class Vote < ActiveRecord::Base
  attr_accessible :user, :position, :candidate

  belongs_to :user
  belongs_to :position
  belongs_to :candidate

  # vote for a candidate for a position
  # assumes correct input is being passed
  def self.vote(user, position, candidate)
    v = Vote.create(:user => user, :position => position, :candidate => candidate)
#success = v.save
    # if this is a duplicate, update the record
    if not success
      v = Vote.where("user_id = ? AND position_id = ?", user.id, position.id)
      v.candidate = candidate
      success = v.save
    end
    return success
  end

end
