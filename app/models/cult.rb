class Cult
  attr_reader :name, :location, :founding_year, :slogan, :age
  attr_accessor :follower, :age

  @@all = []

  def initialize(name, location, founding_year, slogan)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    self.class.all << self
  end

  def recruit_follower(follower, date)
    if follower.age < minimum_age
      "Sadly, you do not meet the age requirements. Try again soon!"
    else
      follower = BloodOath.new(follower, self, date)
    end
  end

  def cult_population
    followers = BloodOath.all.select { |oath| oath.cult == self }
    followers.count
  end

  def self.all
    @@all 
  end

  def self.find_by_name(name)
    self.all.find { |cult| cult.name == name }
  end

  def self.find_by_location(location)
    self.all.select { |cult| cult.location == location }
  end

  def self.find_by_founding_year(year)
    self.all.select { |cult| cult.founding_year == year }
  end

  def followers
    oaths = BloodOath.all.select { |oath| oath.cult == self }
    oaths.map { |oath| oath.follower }
  end

  def average_age
    count = followers.count

    ages = followers.reduce(0.0) do |memo, member|
      memo += member.age
      memo
    end
     ages / count
  end

  def my_followers_mottos
    followers.map do |follower|
      follower.motto
    end
  end

  def self.most_common_location
    new_hash = Hash.new(0)

    self.all.each do |cult|
      new_hash[cult.location] += 1
    end
    
    most_locations = new_hash.to_a.max_by { |ele| ele[1] }
    most_locations[0]
  end

  def minimum_age(age = 16)
    @age = age
  end


end