# U2.W4: Pad an Array

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself, with: ].

# 1. Pseudocode

	# 	Create 2 methods, Array#pad and Array#pad! that take an array size 
	# 	(non-negative integer) and an optional pad value as parameters. If 
	# 	the Array length is below the array size parameter, the array should
	# 	be returned padded to the length of the array size. The pad value should 
	# 	be 'nil' unless a value is provided. the Array#pad should return a new
	# 	array (non-destructive), and the Array#pad! should return the original
	# 	array padded out (destructive).

	# 	Validate that the array is >= the array size.
			# # If yes, return array
			# # If no, 
			# 	#pad: 
			# 		copy input array to a new array
			# 		push pad_val onto the new array until it's == array size
			# 	#pad!:
			# 		push pad_val onto the new array until it's == array size
			#
			# Note: the array to operate on is 'self'
# http://code.tutsplus.com/tutorials/ruby-for-newbies-variables-datatypes-and-files--net-15709


# What is the input?
# What is the output? (i.e. What should the code return?)
# What are the steps needed to solve the problem?


# 2. Initial Solution
class Array
	def pad(array_len, pad_val= nil)

		# non-destructive, so working from a copy
		pad_array = Array.new(self)

		# does the array need to be padded?
		return pad_array if pad_array.count >= array_len

		# push pad_val onto array while array < array_len	
		pad_array.push(pad_val) while pad_array.count < array_len
		return pad_array
	end

	def pad!(array_len, pad_val= nil)

		# does the array need to be padded?
		return self if self.count >= array_len

		# push pad_val onto array while array < array_len
		self.push(pad_val) while self.count < array_len
		return self
	end
end

# 3. Refactored Solution



# 4. Reflection 
	# 	Pseudo code really helped me on this one. After the other work this week, 
	# 	pushing the pad_value onto an array was very easy. The pseudo code really 
	# 	broke this down into very simple parts. The only real difference is the the 
	# 	.pad method copies the original array to a new array and the .pad! just 
	# 	operates directly on the original array.
	#
	# 	I did have some trouble getting started at first, as I wasn't adding onto the 
	# 	Array class. I got some pointers on this from 
	# 	# http://code.tutsplus.com/tutorials/ruby-for-newbies-variables-datatypes-and-files--net-15709
	# 	which showed an example of adding an instance method to an existing class. Once I saw this 
	# 	I was good to go. I think DBC should link in some resources for this so students new to 
	# 	this have a quality source for this knowledge.
	# 	
	# 	It's Saturday night, and I don't have any refactoring ideas for what I already have, 
	# 	so I'm going to leave it as is for now.
