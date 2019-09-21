require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
tf = Follower.new(18)
tc = Cult.new(21)
tc.recruit_follower(tf)

tf2 = Follower.new(26)
tc2 = Cult.new(18)
tc2.recruit_follower(tf2)

tc3 = Cult.new(15)
tc3.recruit_follower(tf2)

tf3 = Follower.new(10)
tc3.recruit_follower(tf3)


tc4 = Cult.new(3)
tc4.recruit_follower(tf2)

tf6 = Follower.new(5)
tc6 = Cult.new(1)
tc6.recruit_follower(tf6)


tf7 = Follower.new(18)
tc7 = Cult.new(18)
tc7.recruit_follower(tf7)


tf8 = Follower.new(40)
tc8 = Cult.new(18)
tc8.recruit_follower(tf8)


tf9 = Follower.new(65)
tc9 = Cult.new(18)
tc9.recruit_follower(tf9)


tf10 = Follower.new(18)
tc10 = Cult.new(18)
tc10.recruit_follower(tf10)


tf11 = Follower.new(16)

tc10.recruit_follower(tf11)


tf12 = Follower.new(70)

tc10.recruit_follower(tf12)


tf13 = Follower.new(89)

tc10.recruit_follower(tf13)


tf14 = Follower.new(49)

tc10.recruit_follower(tf14)



tc9.recruit_follower(tf14)

tc8.recruit_follower(tf13)


rf20 = tc7.recruit_follower(tf11)



binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
