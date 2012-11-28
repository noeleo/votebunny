class User < ActiveRecord::Base
  attr_accessible :password, :is_admin

  validates :password, :presence => true, :uniqueness => true
# dont know why :presence=> true not working... when false, errors
#validates :is_admin, :default => false

  has_and_belongs_to_many :elections, :uniq => true
  has_many :votes

end
