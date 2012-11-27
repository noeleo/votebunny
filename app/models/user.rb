class User < ActiveRecord::Base
  attr_accessible :password, :is_admin

  has_and_belongs_to_many :elections, :uniq => true
end
