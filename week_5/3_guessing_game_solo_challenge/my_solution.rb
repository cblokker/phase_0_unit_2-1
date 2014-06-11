# U2.W5: Build a simple guessing game SOLO CHALLENGE


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# 		Create 'GuessingGame' class.
# 			Initialize GuessingGame with an integer called 'answer'.
#
# 		Create instance method GuessingGame#guess
# 			takes an integer called guess and returns a symbol:
# 				:high if guess is > answer
# 				:correct if guess == answer
# 				:low if guess < answer
#
# 		Create instance method GuessingGame#solved? 
# 			returns true if the most recent guess was correct
# 			returns false otherwise

# Input:
# Output:
# Steps:


# 3. Initial Solution

# class GuessingGame
#   def initialize(answer)
#   	# validate input is an integer
#   	raise ArgumentError.new("input not an integer") until answer.is_a? Integer
#   	@answer = answer
#   end

#   def guess(guess)
#   	# validate input is an integer
#   	# puts "guess is #{guess}"
#   	raise ArgumentError.new("input not an integer") until guess.is_a? Integer
#   	@guess = guess

#   	return case
#   		when guess > @answer then :high
#   		when guess < @answer then :low
#   		when guess == @answer then :correct
#   	end
#   end
  
#   def solved?
#   	return @guess == @answer ? true : false
#   end
#   # Make sure you define the other required methods, too
# end

# # 3A. Initial solution driver code
# game = GuessingGame.new(5)

# guess_again = true

# while guess_again
# 	print "enter a guess: "
# 	puts "#{game.guess(gets.chomp.to_i)}"
# 	guess_again = false if game.solved?
# 	puts "----------------------"
# end



# 4. Refactored Solution
class GuessingGame
  def initialize(answer)
  	@answer = answer
  end

  def guess(guess)
  	# puts "guess is #{guess}"
  	@guess = guess

  	return case
  		when guess > @answer then :high
  		when guess < @answer then :low
  		when guess == @answer then :correct
  	end
  end
  
  def solved?
  	# compares guess == answer and returns true or false
  	return @guess == @answer ? true : false
  end
end


# 1. DRIVER TESTS GO BELOW THIS LINE

puts "Guess the number... by Mike Daugherty\n"
puts "I've secretly picked a number from 1 to 10"
puts "Let's see how long it takes you to guess !"

ctr = 0
game = GuessingGame.new(rand(10))
until game.solved?
	ctr += 1
	puts " "
	print "Enter guess ##{ctr}: "
	puts "Your guess is: #{game.guess(gets.chomp.to_i)}"
end

case ctr
	when 1
		puts "Only #{ctr} guess- You are a genius (and very lucky!)."
	when 2
		puts "#{ctr} guesses- You are a genius (and a little lucky!)."
	when 3
		puts "#{ctr} guesses- Excellent, you must be smart or lucky."
	when 4..6
		puts "#{ctr} guesses- Good, you are above average."
	when 7
		puts "#{ctr} guesses- Below average. Better drink another Rock Star."
	when 8 
		puts "#{ctr} guesses- LOL, same score my dog got."
	else
		puts "#{ctr} guesses- LOL, same score my cat got."
end

# 5. Reflection 
#  	http://midwire.github.io/blog/2011/08/26/ruby-performance-case-vs-if-elsif/
# 	Above link tests case vs. if/elsif. Case comes out slower in all instances tested.
# 	Other sites remark that since ruby is slow anyways (interpreted vs compiled) it really
# 	isn't going to be an issue. And if what you are doing with ruby has so many case 
# 	statements that the milli or micro seconds add up, you should probably be using 
# 	something else like C++ or assembly.

# 	This challenge was interesting. Again, by translating the the requirements into 
# 	pseudocode I was able to break up the work into small easy to understand pieces.
#
# 	My initial try had some errors that took me awhile to find and fix. In #solved? I 
# 	was comparing the current guess to the return from #guess, which was working, but 
# 	running #guess twice for each guess, and so was very ugly. I took a walk and got 
# 	some dinner, and when I came back I saw that #solved? needed to compare the current
# 	guess to answer. At that point things worked as I wanted them to.
#
# 	For the refactored code, I wrote a loop to allow you to run the program and 
# 	continue guessing until you get a match. Since I was giving the GuessingGame an
# 	integer from rand(), I droped the check for Integer that I originally had.
# 	Also, since I was using #to_i on the user input for the guesses, the #guess method
# 	did not need to verify it was getting integers. 
#
# 	The game loop turned out to be simple to construct, at least with just one person
# 	guessing. For later revisions, I would add the ability to have multiple players and 
# 	even an AI player. For the AI player, I have ideas for simple algorithms for a smart
# 	AI and a dumb or lucky AI. The players should also be able to pick a difficulty level, 
# 	which will determine how big the number range should be.