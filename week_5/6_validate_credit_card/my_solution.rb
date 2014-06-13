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
class CreditCard

	def initialize(cc_num)
		raise ArgumentError.new("input must be 16 digits") if cc_num.to_s.length != 16
		@cc_num = cc_num
	end

	def check_card
		return (validate_luhn % 10) == 0 ? true : false
	end

	private

	def validate_luhn
		ctr = 1
		cc_sum = 0

		until @cc_num.zero?
			if ctr.odd?
				cc_sum += @cc_num.modulo(10)
				@cc_num = @cc_num.div(10)
			end

			if ctr.even?
				temp = 2 * (@cc_num.modulo(10))
				@cc_num = @cc_num.div(10)
				if temp > 9
					cc_sum += temp - 9
				else
					cc_sum += temp
				end
			end
			ctr += 1
		end
		return cc_sum
	end

end



# 4. Refactored Solution






# 1. DRIVER TESTS GO BELOW THIS LINE

# CreditCard.new(1234567812345678) # => 16 digits 

card = CreditCard.new(4408041234567893)
puts "good card number returns true --> #{card.check_card == true}"

card = CreditCard.new(4408041234567892)
puts "bad card number returns false --> #{card.check_card == false}"

card = CreditCard.new(1000000000000000)
puts "bad card number returns false --> #{card.check_card == false}"


# 5. Reflection 
