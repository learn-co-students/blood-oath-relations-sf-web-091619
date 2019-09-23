class Follower
  attr_reader :name, :age, :motto

  @@all = []

  def initialize(name, age, motto)
    @name = name
    @age = age
    @motto = motto
    @@all << self
  end

  def self.all
    @@all 
  end

  def cults
    oaths = BloodOath.all.select { |oath| oath.follower == self }
    oaths.map { |oath| oath.cult }
  end

  def join_cult(cult, date)
    if self.age < cult.minimum_age
      "Sadly, you do not meet the age requirements. Try again soon!"
    else
      BloodOath.new(self, cult, date)
    end
  end

  def self.of_a_certain_age(age)
    self.all.select { |follower| follower.age >= age }
  end

  def my_cults_slogan
    self.cults.map do |cult|
      cult.slogan
    end
  end

  def self.most_active
    new_hash = Hash.new(0)

    BloodOath.all.each do |oath|
      new_hash[oath.follower] += 1
    end
    
    most_cults = new_hash.to_a.max_by { |ele| ele[1] }
    most_cults[0]
  end

  def self.top_ten
    self.all[0..9]
  end

  def fellow_cult_members

    my_cults = self.cults
    followers = 
    members_in_cults = []

    my_cults.map do |cult|
      cult.followers.each do |follower|
        members_in_cults << follower
      end 
    end

    members_in_cults.uniq

  end

end