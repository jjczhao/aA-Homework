# PHASE 2
def convert_to_int(str)
  begin
    return Integer(str)
  rescue => exception
    return nil if exception.is_a?(StandardError)
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    raise StandardError 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue => e
    if maybe_fruit == "coffee" && e.is_a?(StandardError)
      puts "Thank Your for the coffee, but that is not a fruit! try again."
      retry
    end
  end  
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise StandardError.new("You need to put your best friend's name.") if name.length <= 0
    @name = name
    raise StandardError.new("Not known long enough.") if yrs_known < 5
    @yrs_known = yrs_known
    raise StandardError.new("You need to input the favorite time with best friend.") if fav_pastime.length <= 0
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end

