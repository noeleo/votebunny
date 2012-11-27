class Election < ActiveRecord::Base
  attr_accessible :title

  has_and_belongs_to_many :users, :uniq => true
  has_many :positions
  has_many :candidates
end
