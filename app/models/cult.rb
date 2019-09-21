class Cult
    attr_accessor :name, :location, :founding_year, :slogan, :followers, :minimum_age
    @@all = []
    def initialize(minimum_age)
        @minimum_age = minimum_age
        @@all << self
    end
    def recruit_follower(follower)
        if follower.age >= @minimum_age
            BloodOath.new(self, follower, "0000-00-00")
        else
            puts "Your time will come young sheep"
        end
    end
    def cult_population
        bloodoaths = BloodOath.all.select do |x|
            x.cult == self
        end
        bloodoaths.count
    end
    def self.all
        @@all
    end
    def self.find_by_name(string)
        @@all.find do |element|
            element.name == string
        end
    end
    def self.find_by_location(string)
        @@all.select do |element|
            element.location == string
        end
    end
    def self.find_by_founding_year(number)
        @@all.select do |element|
            element.founding_year == number
        end
    end
    def average_age
        bloodoaths = BloodOath.all.select do |x|
            x.cult == self
        end
        total = 0
        bloodoaths.each do |x|
            total += x.follower.age
        end
        if bloodoaths.count == 0
            puts "Your cult needs more sheep"
        else
            total / bloodoaths.count
        end
    end
    def my_followers_mottos
        bloodoaths = BloodOath.all.select do |element|
            element.cult == self
        end
        bloodoaths.map do |element|
            element.follower.life_motto
        end
    end
    def followers
        bloodoaths = BloodOath.all.select do |element|
            element.cult == self
        end
        bloodoaths.map do |element|
            element.follower
        end
    end
    def self.least_popular
        least = @@all[0]
        @@all.each do |element|
            if element.followers.count < least.followers.count
                least = element
            end
        end
        least
    end
    def self.most_common_location
        locations = @@all.collect do |element|
            element.location
        end
        locations.max_by {|element| locations.count(element)}
    end
   
end
