# U2.W5: Class Warfare, Validate a Credit Card Number


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode
	# Create class CreditCard that takes a 16 digit number
	# 	initialization method:
	# 		Validate that 16 digits were passed in
 	# 	assign number to instance variable cc_num
	# 	Create public #check_card method
	# 		calls private #validate_luhn
	# 		if validate_luhn % 10 == 0
	# 			return true
	# 		else return false
	# 	Create private #validate_luhn method
	# 		set ctr = 1
	# 		set cc_sum = 0
	# 		while cc_num > 0
	# 			if ctr == odd
	# 				cc_sum += cc_num % 10 # => returns last digit to cc_sum
	# 				cc_num = cc_num / 10 # => removes last digit from cc_num 
	# 			if ctr == even
	# 				temp = (cc_num % 10) * 2
	# 				if temp > 9
	# 					cc_sum += temp - 9
	# 			ctr += 1
	# 		return cc_sum

# Input:
# Output:
# Steps:


# 3. Initial Solution
# class CreditCard

# 	def initialize(cc_num)
# 		raise ArgumentError.new("input must be 16 digits") if cc_num.to_s.length != 16
# 		@cc_num = cc_num
# 	end

# 	def check_card
# 		return (validate_luhn % 10) == 0 ? true : false
# 	end

# 	private

# 	def validate_luhn
# 		ctr = 1
# 		cc_sum = 0

# 		until @cc_num.zero?
# 			if ctr.odd?
# 				cc_sum += @cc_num.modulo(10)
# 				@cc_num = @cc_num.div(10)
# 			end

# 			if ctr.even?
# 				temp = 2 * (@cc_num.modulo(10))
# 				@cc_num = @cc_num.div(10)
# 				if temp > 9
# 					cc_sum += temp - 9
# 				else
# 					cc_sum += temp
# 				end
# 			end
# 			ctr += 1
# 		end
# 		return cc_sum
# 	end

# end



# 4. Refactored Solution
class CreditCard

	def initialize(cc_num)
		raise ArgumentError.new("input must be 16 digits") if cc_num.to_s.length != 16
		@cc_num = cc_num
	end

	def check_card
		return (validate_luhn.modulo(10)) == 0 ? true : false
	end

	private

	def validate_luhn
		ctr = 1
		cc_sum = 0

		until @cc_num.zero? # loops u@cc_num is 0

			# when ctr is odd, just add least significant digit (LSD) to cc_sum
			cc_sum += @cc_num.modulo(10) if ctr.odd?

			# when ctr is even, add LSD * 2
			# if that LSD is >= 10, we need to -9 (to get sum of LSD and MSD)
			if ctr.even?
				cc_sum += 2 * @cc_num.modulo(10)
				cc_sum -= 9 if 2 * @cc_num.modulo(10) >= 10
			end

			# removed LSD from @cc_num
			@cc_num = @cc_num.div(10)

			# increments odd/even ctr
			ctr += 1
		end
 
 		# returns cc_sum to #check_card
		return cc_sum
	end

end





# 1. DRIVER TESTS GO BELOW THIS LINE

# CreditCard.new(1234567812345678) # => 16 digits 

card = CreditCard.new(4408041234567893)
puts "good card number returns true --> #{card.check_card == true}"

card = CreditCard.new(4408041234567892)
puts "bad card number returns false --> #{card.check_card == false}"

card = CreditCard.new(1010101010000000)
puts "good card number returns false --> #{card.check_card == true}"

# 5. Reflection 
## 	This exercise did not take as long as I anticipated. I did have to use a lot of 
## 	value check code because my initial solution logic was not giving my the expected
## 	output. I had to output my values at each step to find where I was going off
## 	track. By doing this I was able to quickly see where my output was not correct
## 	and make the fix. 
##
## 	I had my public method check_card call my private method validate_luhn. validate_luhn
##  did the work of creating the sum of each numbers. Using a counter to track the odd
##  and even numbers I was able to know which numbers get doubled and which don't. I was 
## 	able to simplify the algorithm by just subtracting 9 from any number >= 10 when the
## 	counter was even.
##
## 	I used the #modulus, #odd, and #even methods, which before I would have done a manual
##  check for (x%2 == even). This should make the code more readable, and my intentions 
##  clearer.
## 
##  As in some earlier exercises, I used modulo(10) to access the least significant digit.
##  And when I was done with that number, I used div(10) to remove it so I could repeat 
## 	the loop. I would think having a method to do this would be usefull.
##
## 	The only thing to add would be to implement a true check digit validation step. From the 
## 	definition of the Luhn algorithm I see that the last digit should be calculated from 
## 	the other digits: sum_of_digits * 9.modulo(10)