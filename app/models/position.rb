class Position < ActiveRecord::Base
  attr_accessible :title

  belongs_to :election
  has_and_belongs_to_many :candidates, :unique => true
end
