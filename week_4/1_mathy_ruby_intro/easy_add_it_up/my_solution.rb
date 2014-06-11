# U2.W4: Add it up!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself].

# 1. Pseudocode
	#########################################################
	# Create method "total" which takes an array of numbers
	# and returns the sum of those numbers
		# 	validate array passed into "total" is valid
		# 		- is not a null array
		# 		- all elements are numbers
		# 	return the sum the elements of the array

	#############################################################
	# Create a method "sentance_maker" that takes an array of 
	# string_varings or numbers and returns each element joined into
	# a single string_varing. Each element should be seperated by a space;
		# 	Validate that the array is either numbers or string_varings
		# 		- is not a null array
		# 		- all elements are numbers or strings
		#   Capitalize first element in array
		#   Check if last element is a period
		#   	- if yes, do nothing
		#       - if no, append a period to the array
		# 	return a new string_varing made up of the elements of the array
		# 	join


# What is the input?
# What is the output? (i.e. What should the code return?)
# What are the steps needed to solve the problem?


# 2. Initial Solution
def total(input_array)
	# check if array is empty
	return "Error" if input_array.empty?

	# check if array elements are all numbers
	input_array.each { |e| return "Error" if e.class == String }

	# sum the array
	return input_array.reduce(:+)
end

def sentence_maker(input_array)
	# check if array is empty
	return "null_array" if input_array.empty?

	# => to do: Need code to pop the last element if it's just "."

	# creates one string from array elements,
	# capitalizes first char of new string
	new_string = input_array.join(" ").capitalize

	# => to do: Need code to pop the last element if it's just "."

	# if new string does not have period at end, add one.
	new_string << "." until new_string.end_with?(".")

	return new_string
end

# 3. Refactored Solution
	# I didn't refactor my solution, but I did refactor the array_total_spec.rb file. 
	# I created some tests in my_solution.rb code to check for empty arrays being 
	# passed to either method, and if a non-number element was passed to the total 
	# method. I added some test arrays and code to the rspec file to test for these conditions. 

	# I also tested for string arrays that already have a period at the end of the 
	# last element. So I added some rspec code to check for that condition. The last 
	# error condition that I test for is if the last element is ".". My refactored 
	# solution now checks for that and ensures the output is correct.

def total(input_array)
	# check if array is empty
	return "Error" if input_array.empty?

	# check if array elements are all numbers
	input_array.each { |e| return "Error" if e.class == String }

	# sum the array
	return input_array.reduce(:+)
end

def sentence_maker(input_array)
	# check if array is empty
	return "null_array" if input_array.empty?

	# pops the last element if it's just "."
	input_array.pop if input_array.last == "."

	# creates one string from array elements,
	# and capitalizes first char of new string
	new_string = input_array.join(" ").capitalize

	# if new string does not have period at end, push one on.
	new_string << "." until new_string.end_with?(".")

	return new_string
end



# 4. Reflection 
	# This challenge was fun. I added some extra code to check for some error conditions.
	# I also wrote a test stub to check the .class method against every kind of data type I
	# could think of, just to see what the output looked like. 

	# It took me a little while to get back into the swing of ruby coding. I looked over the
	# code I wrote before phase 0 to get the feel of things again. 

	# sentence_maker() method:
	# My initial solution idea was just to return the output from the join, with a captialize
	# at the end,  which worked and gave me a one line method. But without adding the period
	# at the end, the output did not pass the tests. I had to rethink how I was going to solve 
	# this and what order I was going to solve each individual problem. I ended up formatting the 
	# input array so my original solution could work on it. This seemed the simpilist for me.

	# total() method:
	# I used the .class method to validate that all array elements were numbers, then used the 
	# .reduce method to sum the elements in the array. I found the reduce method a few weeks ago, 
	# and it saves me from having to write code to itterate through an array to get a sum total.
