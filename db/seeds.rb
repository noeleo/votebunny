# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create election
e = Election.create!(:title => 'IEEE Director Elections')

# create admin
u = User.new(:password => 'wadup', :is_admin => true)
u.elections << e
u.save!

# create users
passwords = ['xx', 'yy']
passwords.each do |pw|
  u = User.new(:password => pw, :is_admin => false)
  u.elections << e
  u.save!
end

# create positions and candidates
runners = {
  'Indrel Director' => ['Jamshed', 'Harrison', 'Vikram', 'Marion'],
  'Activities Director' => ['Ino', 'Leland', 'Alice'],
  'TechOps Director' => ['Eugene', 'Felix'],
  'Website Director' => ['Yuval', 'Kevin', 'Steve', 'Tom', 'Felix'],
  'IO Director' => ['Lauren', 'Jonathan', 'Flora', 'Nate', 'Marion', 'Tabitha'],
  'HOPE Director' => ['Jeff', 'Andrew'],
  'Prodev Director' => ['Skyler']
}

runners.each do |position, candidates|
  p = Position.new(:title => position, :election => e)
  p.save!
  candidates.each do |candidate|
    c = Candidate.new(:name => candidate, :election => e)
    c.positions << p
    c.save!
  end
end
