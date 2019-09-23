require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

mmm = Cult.new("mmm", "longmont", 2010, "ride a bicycle")
glossier = Cult.new("glossier", "NYC", 2014, "be yourself")
boosted = Cult.new("boosted", "NYC", 2014, "skate on")


pete = Follower.new("pete", 40, "be best")
emily = Follower.new("emily", 34, "be you")
phil = Follower.new("phil", 34, "save money")

pete.join_cult(mmm, "Sept 2019")
emily.join_cult(glossier, "Sept 2019")

boosted.recruit_follower(phil, "Sept 2019")
glossier.recruit_follower(phil, "Oct 2019")
glossier.recruit_follower(pete, "Oct 2019")
boosted.recruit_follower(pete, "Oct 2019")

puts "glossier.cult_population = 2"
puts glossier.cult_population

puts "boosted.cult_population = 1"
puts boosted.cult_population

puts "Cult.find_by_name(glossier) == glossier"
puts Cult.find_by_name('glossier') == glossier

puts "Cult.find_by_location('NYC') = [glossier]"
p Cult.find_by_location('NYC')

puts "Cult.find_by_founding_year(2010) = [boosted]"
p Cult.find_by_founding_year(2010)

puts 'boosted.followers = 1'
puts boosted.followers

puts 'glossier.average_age = 36'
puts glossier.average_age

puts "glosser.my_followers_mottos = 'be you', 'save money', 'be best'"
puts glossier.my_followers_mottos

puts "Cult.most_common_location = 'NYC' "
puts Cult.most_common_location 

puts "glossier.minimum_age = 16"
puts glossier.minimum_age(20)

puts 'pete.cults = [mmm, glossier]'
puts pete.cults

puts "Follower.of_a_certain_age(34) = [emily, phil, pete"
puts Follower.of_a_certain_age(34)

puts "pete.my_cults_slogan = [slogans]"
puts pete.my_cults_slogan

puts "Follower.most_active = pete "
puts Follower.most_active

puts "Follower.top_ten = pete, phil, emily "
puts Follower.top_ten

puts "emily.join_cult(glossier) = error message"
rainbow = Follower.new("rainbow", 15, "stay in school")
puts rainbow.join_cult(glossier, "Sept 2019")

puts "pete.fellow_cult_members = [phil, emily]"
puts pete.fellow_cult_members

puts "Mwahahaha!" # just in case pry is buggy and exits
