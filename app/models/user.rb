class User < ActiveRecord::Base
  attr_accessible :password, :is_admin

  validates :password, :presence => true, :uniqueness => true
  validates :is_admin, :presence => true

  has_and_belongs_to_many :elections, :uniq => true
  has_many :votes

end
