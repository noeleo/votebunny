# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:password => 'wadup', :is_admin => true)
e = Election.create(:title => 'IEEE Director Elections')
u = User.new(:password => 'xxx', :is_admin => false)
u.elections << e
u.save

p1 = Position.new(:title => 'Indrel Director')
p1.election = e
p1.save
p2 = Position.new(:title => 'Activities Director')
p2.election = e
p2.save
c = Candidate.new(:name => 'Alice')
c.election = e
c.positions << p1
c.save
c = Candidate.new(:name => 'Bob')
c.election = e
c.positions << p2
c.save
c = Candidate.new(:name => 'Charlie')
c.election = e
c.positions << p1
c.positions << p2
c.save
