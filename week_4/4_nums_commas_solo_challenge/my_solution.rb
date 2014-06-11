# U2.W4: Numbers to Commas Solo Challenge

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  


# 1. Pseudocode
	# Create method seperate_comma that takes a numberic value and
	# returns a string with properly comma seperated number.

	# 	loop the following until intput number is fully processed:

	# 		using modulus 10, remove last number from input
	# 		and using .unshift() push this number onto front
	# 		out ouput array.

	# 		every third number, unshift "," onto array.

	# 		remove the last number from input using integer
	# 		division (number / 10).

	# 	using join, convert the output array to a single string
	# 	and return this string.

# What is the input?
# What is the output? (i.e. What should the code return?)
# What are the steps needed to solve the problem?


# 2. Initial Solution
# ctr = 0
# out_array = Array.new
################## First try #######################
# until num == 0
# 	out_array.unshift(",") if ctr % 3 == 0
# 	out_array.unshift((num % 10).to_s)
# 	num /= 10
# 	ctr += 1
# end
# out_array.pop
# puts " "
# puts "out_array is #{out_array.join}"
################## First try #######################



# 3. Refactored Solution
def separate_comma(input_num)
	out_array = Array.new
	ctr = 0
	is_neg = false

	# 	handles negative numbers.
	if input_num < 0
		input_num = input_num.abs
		is_neg = true
	end

	# 	handles 0 as an input
	if input_num == 0
		out_array.push("0", ",")
	end

	# 	removes least significant digit from input_num and pushes it to the front of 
	# 	the out_array. ctr pushes a comma to the front of the out_array every 3 digits
	# 	Loops until input_num has been fully pushed onto out_array
	until input_num == 0
		out_array.unshift(",") if ctr % 3 == 0
		out_array.unshift((input_num % 10).to_s)
		input_num /= 10
		ctr += 1
	end

	# 	removes the last element of out_array, which is always a ","
	out_array.pop

	# 	if teh is_neg was set 'true', pushes neg sign to the front of the out_array
	out_array.unshift("-") if is_neg

	# 	joins the elements of out_array to a single string, then returns that string
	return out_array.join
end


# 4. Reflection 
	# This exercise was not too bad. I am familure with integer division and modulus,
	# so creating an algorithm to process the input number was not too hard. I used
	# the .unshift method to push the numbers from the end of input_num to the front
	# of out_array. I could have just used .push then .reverse, but felt .unshift was 
	# just fine.

	# Pushing the comma onto the array was kind of a problem as I either had a comma at the end
	# of the out_array, or would sometimes have one at the front of the array. I messed around with this
	# without success for a while before realizing that if I always know the last element is a comma, I 
	# can always just pop it back off, so that's what I did.

	# At this point everything works, and the rspec file worked fine. I then started looking
	# for other issues that could come up, and I decided to try and handle an input number of 0 
	# and for negative input numbers. 

	# For zero's, I just did a comparison and pushed the zero onto the out_array. Since the main
	# proccessing loop is skipped if the input_num == 0, the rest of the code worked fine and I 
	# got my expected output.

	# For negative numbers, I used the .abs function to convert it to positive, which allowed the 
	# rest of the code to run as normal. I set a bool to .unshift the negative sign back onto the 
	# processed number. 

	# Turned out to be very easy to handle both of these cases. I also added some 
	# rspec code to test these cases.