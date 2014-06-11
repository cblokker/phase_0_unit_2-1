# U2.W5: Die Class 1: Numeric


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# Input:
# Output:
# Steps:

# 	notes:
# 	each 'Die' object is an instance of class 'Class'. 
		# 	class Name
		# 		...code here
		# 		...code here
		#	end
# 	When a new class is defined an dobject of type Class is created
# 	and assigned to a constant (Name. as shown above).
# 	When Name.new is called to create a new object, the new class
# 	method in Class is run by default. This invokes 'allocate' to
# 	allocate memory for the object. before calling the new object's
# 	'initialize' method.
# 	The constructing and initializing phases of an object are separate
# 	and both can be over-ridden. 
# 	The construction is done via the 'new' class method.
# 	The initialization is done via the 'initialize' instance method.
# 	'Initialize' is not a constructor.


# 3. Initial Solution

# class Die
#   def initialize(sides)
#     # code goes here
#     until sides.is_a? Numeric
#     	raise ArgumentError.new("\"#{sides}\" must be an integer")
#     end

#     until sides > 0
#     	raise ArgumentError.new("Die must have side > 0")
#     end
#     @sides = sides
#   end
  
#   def sides # => what the object knows aka 'instance variables'
#     # code goes here
#     return @sides
#   end
  
#   def roll # => what the object does (methods)
#     # code goes here
#     rand(1..@sides)
#   end
# end



# 4. Refactored Solution
class Die
  # attr_accessor :sides
  # attr_writer :sides
  attr_reader :sides  

  def initialize(sides)  

    # kicks out error if input is not > 0
    until sides > 0
      raise ArgumentError.new("Die must have side > 0")
    end

    @sides = sides

  end
  
  def roll # => what the object does (methods)
    rand(1..@sides)
  end
end


# 1. DRIVER TESTS GO BELOW THIS LINE

puts "-----------------------------------------------------------------------"
six_sider = Die.new(6)
puts "six_sider has #{six_sider.sides} sides"
puts "We just rolled a #{six_sider.roll}"
99.times { print "#{six_sider.roll}, " }
puts "#{six_sider.roll}"
# puts "-----------------------------------------------------------------------"
# ten_sider = Die.new(10)
# puts "ten_sider has #{ten_sider.sides} sides"
# puts "We just rolled a #{ten_sider.roll}"
# 99.times { print "#{ten_sider.roll}, " }
# puts "#{ten_sider.roll}"
# puts "-----------------------------------------------------------------------"
# zero_sider = Die.new(0)
# puts "zero_sider has #{zero_sider.sides} sides"
# puts "We just rolled a #{zero_sider.roll}"
# 99.times { print "#{zero_sider.roll}, " }
# puts "#{zero_sider.roll}"
# puts "-----------------------------------------------------------------------"
# neg_sider = Die.new(-5)
# puts "neg_sider has #{neg_sider.sides} sides"
# puts "We just rolled a #{neg_sider.roll}"
# 99.times { print "#{neg_sider.roll}, " }
# puts "#{neg_sider.roll}"


# 5. Reflection 
# 	seems like a lot of info:
# 	http://stackoverflow.com/questions/198460/how-to-get-a-random-number-in-ruby

# attr_ :
# http://stackoverflow.com/questions/5046831/why-use-rubys-attr-accessor-attr-reader-and-attr-writer
#   
#   I used information from the above two links for information on random numbers and accessors.
#   My initial solution did not use any built in accessors, but after reviewing some other cohorts
#   code, I decided to look into them. I used the attr_reader after testing how the attr_read, 
#   attr_write, and attr_accessor worked. 