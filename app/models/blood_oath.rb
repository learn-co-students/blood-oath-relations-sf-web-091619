class BloodOath
    attr_accessor :cult, :follower, :date
    @@all = []
    def initialize(cult, follower, date)
        @cult = cult
        @follower = follower
        @date = date
        @@all << self
    end
    def initiation_date
        @date
    end
    def self.all
        @@all
    end
    def self.first_oath
        @@all[0].follower
    end

end