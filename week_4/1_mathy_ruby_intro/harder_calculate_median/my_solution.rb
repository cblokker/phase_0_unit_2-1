# U2.W4: SOLO CHALLENGE Calculate the Median!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself].

# 1. Pseudocode
	# Create a method called median that takes an array and returns the median value.
	# 	Note: median is the middle value of a test of sorted elements. If the set 
	# 	of values is even in number, then the average of the middle 2 numbers is 
	# 	the median.

	# 	Create median method with an array for an input.
	# 		Validate if array is numbers or strings
	# 		if numbers determin if even or odd number of elements
	# 			if even:
	# 				sort array
	# 				find middle 2 elements
	# 				return mean of the 2 middle elements
	# 			if odd:
	# 				sort array
	# 				return middle element
	# 		if strings:
	# 			sort array
	# 			return middle element

# What is the input?
# What is the output? (i.e. What should the code return?)
# What are the steps needed to solve the problem?


# 2. Initial Solution
# def median(input_array)
#   is_a_numb = true
#
#   input_array.each { |e|
#     is_a_numb = false if e.class == String
#   }
#
#   if is_a_numb # => array contains only numbers
#     if input_array.length.even? # => runs if array has even # of elements
#       input_array.sort!
#       first_element = input_array[(input_array.length - 1 ) / 2]
#       second_element = input_array[(input_array.length + 1) / 2]
#       return (first_element + second_element) / 2.0
#     else # => runs if arry has odd # of elements
#       input_array.sort!
#       return input_array[(input_array.length) / 2]
#     end
#   end
#
#   if !(is_a_numb) # => for arrays of strings
#     input_array.sort!
#     return input_array[(input_array.length) / 2]
#   end
# end


# 3. Refactored Solution
def median(input_array)
	input_array.sort!
	if input_array.length.even?
		return (input_array[(input_array.length - 1) / 2] + input_array[input_array.length / 2]) / 2.0
	else
		return input_array[(input_array.length) / 2]
	end
end

# 4. Reflection
	# 	Another interesting problem to solve. In my case I did get a lot of milage out
	# 	of the refactoring process. As I looked at my original code I saw right away that 
	# 	sorting the array was universal, so just do that right away and get it out of the way.
	# 	I also saw that the median process for arrays of strings was the same for as for number 
	# 	arrays. So I combined them together. The only real decision to make is whether the array
	# 	has an odd or even number of elements. 
	# 	One issue is arrays of strings with even number of elements won't work with this algorithm.
	# 	An idea to handle string arrays with an even number of elements is to concatenate the 
	# 	2 middle elements. I would propose this as a solution that would allow any set of number 
	# 	and string arrays to return correct or meaningfull information.
	#
	# 	I used my knowledge of integer division to get to the middle 2 elements for even arrays.
	# 	I also looked at the .values_at and .slice methods for getting to the elements I wanted, 
	# 	but didn't see any real advantages of useing these over what I did use. 
	# 	I also replace the modulus code to determine if the array has even number of elements with 
	# 	the .even? method. This way anybody reading the code should see right away what I'm looking for.
	# 	
