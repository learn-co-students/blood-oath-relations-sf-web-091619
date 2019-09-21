class Follower
    attr_accessor :name, :life_motto, :age
    @@all = []
    def initialize(age)
        @age = age
        @@all << self
    end
    def join_cult(cult)
        if @age >= cult.minimum_age
            BloodOath.new(cult, self, "0000-00-00")
        else
            puts "Your time will come young sheep"
        end
    end
    def self.all
        @@all
    end
    def self.of_a_certain_age(number)
        @@all.select do |element|
            element.age >= number
        end
    end
  
    def my_cults_slogans
        bloodoaths = BloodOath.all.select do |element|
            element.follower == self
        end
        bloodoaths.each do |element|
            puts element.cult.slogan
        end
        return
    end
    def cults
        bloodoaths = BloodOath.all.select do |element|
            element.follower == self
        end
        bloodoaths.map do |element|
            element.cult
        end
    end 
    def self.most_active
        followers = BloodOath.all.map do |x|
            x.follower
        end
        followers.max_by {|element| followers.count(element)}
    end
    def self.top_ten
        followers = BloodOath.all.map do |x|
            x.follower
        end
        opp_followers = followers.uniq.sort_by {|x| x.cults.size}
        opp_followers.reverse[0...9]
        
    end
    def fellow_cult_members
        followers = []
        BloodOath.all.each do |bloodoath|
            if self.cults.include?(bloodoath.cult) && bloodoath.follower != self
                followers << bloodoath.follower
            end
        end      
        followers.uniq
    end
    
end