class Candidate < ActiveRecord::Base
  attr_accessible :name

  belongs_to :election
  has_and_belongs_to_many :positions, :uniq => true
end
