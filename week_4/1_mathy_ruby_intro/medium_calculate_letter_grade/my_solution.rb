# U2.W4: Calculate a letter grade!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself].

# 1. Pseudocode
# create method ( get_grade )that takes an array of numbers and
# returns the following based on the average of the
# elements in the array:
# 	returns "A" when the average is >= 90
# 	returns "B" when the average is >= 80
# 	returns "C" when the average is >= 70
# 	returns "D" when the average is >= 60
# 	returns "F" when the average is < 60
#
# Validate array is not null, and all elements are numbers.
# 	Return error if null or non-numbers present
#
# sum the array, and divide by number of elements and assigne to array_avg var
#
# using case statement, return the appropriate letter grade based on the array_avg value

# What is the input?
# What is the output? (i.e. What should the code return?)
# What are the steps needed to solve the problem?


# 2. Initial Solution

# def get_grade(scores_array)

# 	# check if array is empty
# 	return "Error" if scores_array.empty?	

# 	# check if array elements are all numbers
# 	scores_array.each { |e| return "Error" if e.class == String }

# 	# sum the array and get average of scores
# 	array_avg = scores_array.reduce(:+) / scores_array.count

# 	Experiment, using case instead
# 	return "A" if array_avg > 90
# 	return "B" if array_avg > 80
# 	return "C" if array_avg > 70
# 	return "D" if array_avg > 60
# 	return "F" if array_avg < 60

# 	case array_avg
# 		when 90..100
# 			return "A"
# 		when 80..89
# 			return "B"
# 		when 70..79
# 			return "C"
# 		when 60..69
# 			return "D"
# 		when 0..59
# 			return "F"
# 		else
# 			return "Error"
# 		end
# end


=======
  
>>>>>>> 7d651fde399ec15c32098d95ec53b79105435271

# 3. Refactored Solution
def get_grade(scores_array)

	# check if array is empty
	return "Error" if scores_array.empty?	

	# check if array elements are all numbers
	scores_array.each { |e| return "Error" until e.is_a? Numeric }

	# sum the array and get average of scores
	array_avg = scores_array.reduce(:+) / scores_array.count

	return case 
		when array_avg >= 90 then "A"
		when array_avg >= 80 then "B"
		when array_avg >= 70 then "C"
		when array_avg >= 60 then "D"
		when array_avg <  60 then "F"
	end
end


# 4. Reflection 
# 
# => deep dive into the behind the scenes process for a case statement:
# 	http://www.daniellesucher.com/2013/07/23/ruby-case-versus-if/
#
# => ruby style guide that came in handy:
# 	https://github.com/bbatsov/ruby-style-guide
#
#
# 	I reused my error checking routines to ensure the arrays passed into get_grade
# 	are not null or have non-numeric data in them. 
# 	I also experimented with some different ways of returning the correct letter
# 	grade besides using a case statement. I spent some time reading up on the best
# 	way to do these kinds of comparisons. I found the ruby .between? method, which 
# 	could be used. Also, at the link above, I found some interesting information about
# 	what differences their are between if/else and case statements really are. 
#
# 	I also researched how to compact the case statement down to it's essentials. Before
# 	ruby v 1.9 you could use the ":" colon operator to separate out the comparison and
# 	the return statement, but that has been depreciated since ruby v1.9. You can also
# 	use the ";" semi-colon to separate these out as well, but I found that most style
# 	guides recommend against this. Using the "when-then" syntax is much clearer and 
# 	still brief. 
#  	I also learned that there are 2 ways to set up a case statement. The original way 
# 	I did it does not allow for comparison operations, it's limited to range comparisons.
# 	The 2nd way I set it up allows comparisons. I changed my case to this style because
# 	it better matches the requirements as stated in the rspec file. The original style I
# 	used did not allow for scores over 100 or below 0 to return a letter grade. 
#
#   Overall I learned more that I was thought I was going to from what seemed a simple
# 	challenge, but when I started looking at the layout of the case statement and how 
# 	to get the correct output without a case statement I learned just how many different
# 	ways there are to work through any problem. 
#  
#  	Oh, I also added some rspec tests to check for correct returns when null and non-
# 	numeric arrays to the get_grade method. 
