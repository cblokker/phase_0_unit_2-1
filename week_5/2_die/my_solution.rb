# U2.W5: Die Class 2: Arbitrary Symbols


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode
	# 	Create Class called Die, that takes an array.
	# 		Die has a method 'sides' that returns the input_array.count
	#
	# 		Die has a method 'roll' that raondomly returns one of the input
	# 		array elements
	#

# Input:
# Output:
# Steps:


# 3. Initial Solution

# class Die
# 	attr_reader :labels

#   def initialize(labels)
#   	if labels.empty?
#   		raise ArgumentError.new("Error: input array is empty")
#   	end
#   	@labels = labels
#   end

#   def sides
#   	@labels.count
#   end

#   def roll
# 		# @labels[rand(@labels.count)] # => works fine
# 		# @labels.shuffle.pop # => Also works
# 		@labels.sample
#   end
# end



# 4. Refactored Solution

class Die

  def initialize(labels)
  	raise ArgumentError.new("Error: input array is empty") if labels.empty?
  	@labels = labels
  end

  def sides
  	@labels.count
  end

  def roll
		@labels.sample
  end

end





# 1. DRIVER TESTS GO BELOW THIS LINE

puts "-------------------------------------------------"
array_A = ['A', 'B', 'C', 'D', 'E', 'F']
die_A = Die.new(array_A)
puts "die_A has #{array_A.count} sides: #{array_A.count == die_A.sides}"
die_roll = die_A.roll
puts "die_A roll #{die_roll} matches element from array_A: #{array_A.include?(die_roll)}"
puts "-------------------------------------------------"


# 5. Reflection 
# 		This exercise went by quickly. My only real issue was the #roll method- I tried several different 
# 		ways of getting random output from an array. The shuffle method is probably expensive to use.
# 		I'm not sure how "random" #sample really is. I tried to look that up but only got hits on how to 
# 		use it. 
# 		Again, having good pseudo code simplified what needed to be done into small, easy to finish steps.