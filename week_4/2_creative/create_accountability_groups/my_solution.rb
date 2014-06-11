# U2.W4: Create Accountability Groups


# I worked on this challenge [by myself].


# Are there built-in methods to do this in Ruby?
	# 	I used the .slice! method to pop sets of 4 elements
	# 	off of the input array and push them onto the student_groups
	# 	array. I used the destructive version because it allowed me
	# 	to make some tests on the the input array to make decisions
	# 	on what to do next.


# Will you try to avoid putting the same people together more than once?
	# 	I did not look at this issue. I used the .shuffle method and am
	# 	relying on this for randomization. If you output the results to
	# 	file you can pull that in and do a comparison. At this point you
	# 	need some number theory to determin how small of a data set before
	# 	you should expect to see duplicates. 

# If I run this program three times in a row, will the program 
# give me three different outputs? Is that good or bad?
	# 	My algorithm does a shuffle on the input array each time it's run.
	# 	This will give you a different student_group each time it's run.
	# 	
	# 	Ideally, I think the program should provide a nicely formatted output
	# 	file that can be exported into text files or spreadsheets. 
	# 	This output file can then be accessed by the program if you want to 
	# 	do any kind of checks for duplicate groups.

# Should it remember past outputs or not?
	# 	I don't think the program itself should need to remember
	# 	past runs. I do think it should be able to output it's info
	# 	to file that it can then read back in if you want to do 
	# 	any kind of comparisons against previous runs to check for
	# 	duplicate groups. You could for example read in the current 
	# 	list and using .rotate move everybody in a controlled way. 
	# 	The .permutation method looks like it could be used as well
	# 	to generate a set of groups that would be unique.



# 2. Pseudocode
		# Create a method that takes an array of strings and returns 
		# arrays of 4 elements made up from the input array.
		# In cases where the input array is not divisible by 4, add
		# the remainder to one of the output arrays. This means up to
		# the first 3 groups may have a 5th person.
			# 	The output should be randomized, so it's different each time
			# 	it's run.
			# 	The output arrays should be named accountability_group #, with 
			# 	the number incramenting from 1 to x as needed.

		# Repeat until input array is empty:
		# 	Shuffle the input array
		# 	Remove 4 elements from the input array and push them onto the 
		# 	output array as and array of 4 strings.

		# Check the last array element in the output array and count it's elements.
		# 	If the last element has 4 elements, we are done. Output the array.

		# 	If the last element has less than 4 elements, pop one element off at a 
		# 	time and push it onto the first elements. Continue until the last 
		# 	element is empty. Output the array


# Input:
# Output:
# Steps:


# 3. Initial Solution

# def make_groups(input_array)

# 	input_array.shuffle!
# 	student_groups = Array.new

# 	# seperates input_array into sets of 4 elements in student_groups
# 	until input_array.count < 4
# 		student_groups.push( input_array.slice!(0, 4) )
# 	end

# 	# 	if student_groups is empty, the input_array was passed in with 4 or less elements, 
# 	# 	so is good as is. Otherwise the else statement pops the remaining input array 
# 	# 	elements onto the first few output array elements to even things out.
# 	if student_groups.empty?
# 		puts "student group #1: #{input_array}"
# 	else
# 		# => to do: 
# 		# 	need to handle cases where student_groups.count < input_array.count
# 		# 	these cases fail with this algorithm (input_array has 6, 7, 11 elements)
# 		input_array.each_index { |e| student_groups[e].push(input_array[e]) }
# 		student_groups.each_index { |e| puts "student group #{e + 1}: #{student_groups[e]}"}
# 	end
# end


# 4. Refactored Solution
def make_groups(input_array)

	input_array.shuffle!
	student_groups = Array.new

	# seperates input_array into sets of 4 elements in student_groups
	# until there are less than 4 elements left
	until input_array.count < 4
		student_groups.push( input_array.slice!(0, 4) )
	end

	# 	if student_groups is empty, the input_array was passed in with 4 or less elements, 
	# 	so it's good as is. Otherwise the else statement pops the remaining input array 
	# 	elements onto the first few output array elements to even things out.
	if student_groups.empty?
		input_array.each_index { |x| student_groups.push(input_array[x]) }
		puts "student group 1: #{input_array}"
	else
		# => to do: ###############################################################################
		# => to do: 	need to handle cases where student_groups.count < input_array.count
		# => to do: 	these cases fail with this algorithm (input_array has 6, 7, or 11 elements)
		###########################################################################################

		# Any elements still in the input array (could be 0 - 3 elements) are pushed
		# onto the first 0 - 3 elements of the student_groups array. The accounts for extra 
		# students not evenly divisible by 4. 
		input_array.each_index { |e| student_groups[e].push(input_array[e]) }
		student_groups.each_index { |e| puts "student group #{e + 1}: #{student_groups[e]}"}
	end

	return student_groups
end







# 1. DRIVER TESTS GO BELOW THIS LINE

bobolinks_2014 = ["Casey Ryan", "Clayton Jordan", "Dakota Cousineau", "David Nanry", "Dev Deol", "Duke Greene", "Edgar Garza", "Grace Yim", "Geff Keslin", "Jennie Chamberlin", "Joey Chamerlin", "Joey Sabani", "Kajal Agarwal", "Krystyna Ewing", "Lovinder Pnag", "Maria Magdalena Ang", "Michael E Daugherty", "Michael Kirlin", "Neel Shah", "Robert Schwartz", "Sebastian Caso", "Sebastian Radloff", "Stephanie Chou", "Steve Piklny"]
new_array = (make_groups(bobolinks_2014))
new_array2 = [4, 4, 4, 4, 4, 4]
puts " "
puts "There should be #{new_array2.count} Student Groups: #{new_array.count == new_array2.count}"
new_array.each_index { |x| puts "Student Group #{x+1} should have #{new_array2[x]} students: #{new_array[x].count == new_array2[x]}" }
puts "=============================================================================================="

bobolinks_extras = ["Casey Ryan", "Clayton Jordan", "Dakota Cousineau", "David Nanry", "Dev Deol", "Duke Greene", "Edgar Garza", "Grace Yim", "Geff Keslin", "Jennie Chamberlin", "Joey Chamerlin", "Joey Sabani", "Kajal Agarwal", "Krystyna Ewing", "Lovinder Pnag", "Maria Magdalena Ang", "Michael E Daugherty", "Michael Kirlin", "Neel Shah", "Robert Schwartz", "Sebastian Caso", "Sebastian Radloff", "Stephanie Chou", "Steve Piklny", "Extra Guy One", "Extra Guy Two", "Extra Guy Three"]
new_array = (make_groups(bobolinks_extras))
new_array2 = [5, 5, 5, 4, 4, 4]
puts " "
puts "There should be #{new_array2.count} Student Groups: #{new_array.count == new_array2.count}"
new_array.each_index { |x| puts "Student Group #{x+1} should have #{new_array2[x]} students: #{new_array[x].count == new_array2[x]}" }
puts "=============================================================================================="

med_list_56 = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming", "District of Columbia", "Puerto Rico", "Guam", "American Samoa", "U.S. Virgin Islands", "Northern Mariana Islands"]
new_array = (make_groups(med_list_56))
new_array2 = [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4]
puts " "
puts "There should be #{new_array2.count} Student Groups: #{new_array.count == new_array2.count}"
new_array.each_index { |x| puts "Student Group #{x+1} should have #{new_array2[x]} students: #{new_array[x].count == new_array2[x]}" }
puts "=============================================================================================="

xl_list_195 = ["Afghanistan", "Albania", "Algeria", "Angola", "Antigua & Deps", "Argentina", "Armenia", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bhutan", "Bolivia", "Bosnia Herzegovina", "Botswana", "Brazil", "Brunei", "Bulgaria", "Burkina", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Central African Rep", "Chad", "Chile", "China", "Colombia", "Comoros", "Congo", "Congo {Democratic Rep}", "Costa Rica", "Croatia", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Fiji", "Finland", "France", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Greece", "Grenada", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Honduras", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland {Republic}", "Israel", "Italy", "Ivory Coast", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea North", "Korea South", "Kosovo", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macedonia", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Mauritania", "Mauritius", "Mexico", "Micronesia", "Moldova", "Monaco", "Mongolia", "Montenegro", "Morocco", "Mozambique", "Myanmar,{Burma}", "Namibia", "Nauru", "Nepal", "Netherlands", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Poland", "Portugal", "Qatar", "Romania", "Russian Federation", "Rwanda", "St Kitts & Nevis", "St Lucia", "Saint Vincent & the Grenadines", "Samoa", "San Marino", "Sao Tome & Principe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Sudan", "Spain", "Sri Lanka", "Sudan", "Suriname", "Swaziland", "Sweden", "Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "Thailand", "Togo", "Tonga", "Trinidad & Tobago", "Tunisia", "Turkey", "Turkmenistan", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "Uruguay", "Uzbekistan", "Vanuatu", "Vatican City","Venezuela", "Vietnam", "Yemen", "Zambia", "Zimbabwe",]
new_array = (make_groups(xl_list_195))
new_array2 = [5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4]
puts " "
puts "There should be #{new_array2.count} Student Groups: #{new_array.count == new_array2.count}"
new_array.each_index { |x| puts "Student Group #{x+1} should have #{new_array2[x]} students: #{new_array[x].count == new_array2[x]}" }
puts "=============================================================================================="

short_list_1 = ["Jonny"] # => modified driver code for < 4 elements
new_array = (make_groups(short_list_1))
new_array2 = [1]
puts " "
puts "There should be #{new_array2.count} Student Group: #{new_array2[0] == new_array.count}"
puts "Student Group #{new_array2.count} should have #{new_array.count} student: #{new_array2[0] == new_array.count}"
puts "=============================================================================================="

short_list_2 = ["Jonny", "Beatty"] # => modified driver code for < 4 elements
new_array = (make_groups(short_list_2))
new_array2 = [2]
puts " "
puts "There should be #{new_array2.count} Student Group: #{new_array2[0] == new_array.count}"
puts "Student Group #{new_array2.count} should have #{new_array.count} students: #{new_array2[0] == new_array.count}"
puts "=============================================================================================="

short_list_3 = ["Jonny", "Beatty", "Third Wheel"] # => modified driver code for < 4 elements
new_array = (make_groups(short_list_3))
new_array2 = [3]
puts " "
puts "There should be #{new_array2.count} Student Group: #{new_array2[0] == new_array.count}"
puts "Student Group #{new_array2.count} should have #{new_array.count} students: #{new_array2[0] == new_array.count}"
puts "=============================================================================================="

short_list_4 = ["Jonny", "Beatty", "Third Wheel", "Afghanistan"]
new_array = (make_groups(short_list_4))
new_array2 = [4]
puts " "
puts "There should be #{new_array2.count} Student Group: #{new_array.count == new_array2.count}"
new_array.each_index { |x| puts "Student Group #{x+1} should have #{new_array2[x]} students: #{new_array[x].count == new_array2[x]}" }
puts "=============================================================================================="

short_list_5 = ["Jonny", "Beatty", "Third Wheel", "Afghanistan", "Albania"]
new_array = (make_groups(short_list_5))
new_array2 = [5]
puts " "
puts "There should be #{new_array2.count} Student Groups: #{new_array.count == new_array2.count}"
new_array.each_index { |x| puts "Student Group #{x+1} should have #{new_array2[x]} students: #{new_array[x].count == new_array2[x]}" }
puts "=============================================================================================="

# short_list_6 = ["Jonny", "Beatty", "Third Wheel", "Afghanistan", "Albania", "Cameroon"]
# new_array = (make_groups(short_list_6))
# new_array2 = [6]
# puts " "
# puts "There should be #{new_array2.count} Student Groups: #{new_array.count == new_array2.count}"
# new_array.each_index { |x| puts "Student Group #{x+1} should have #{new_array2[x]} students: #{new_array[x].count == new_array2[x]}" }
# puts "=========== This test crashes program ========================================================="

# short_list_7 = ["Jonny", "Beatty", "Third Wheel", "Afghanistan", "Albania", "Canada", "Cape Verde"]
# new_array = (make_groups(short_list_7))
# new_array2 = [7]
# puts " "
# puts "There should be #{new_array2.count} Student Groups: #{new_array.count == new_array2.count}"
# new_array.each_index { |x| puts "Student Group #{x+1} should have #{new_array2[x]} students: #{new_array[x].count == new_array2[x]}" }
# puts "=========== This test crashes program ========================================================="

short_list_8 = ["Jonny", "Beatty", "Third Wheel", "Afghanistan", "Albania", "Algeria", "Angola", "Antigua & Deps"]
new_array = (make_groups(short_list_8))
new_array2 = [4, 4]
puts " "
puts "There should be #{new_array2.count} Student Groups: #{new_array.count == new_array2.count}"
new_array.each_index { |x| puts "Student Group #{x+1} should have #{new_array2[x]} students: #{new_array[x].count == new_array2[x]}" }
puts "=============================================================================================="

short_list_09 = ["Jonny", "Beatty", "Third Wheel", "Afghanistan", "Albania", "Algeria", "Angola", "Antigua & Deps", "Bangladesh", "Barbados"]
new_array = (make_groups(short_list_09))
new_array2 = [5, 4]
puts " "
puts "There should be #{new_array2.count} Student Groups: #{new_array.count == new_array2.count}"
new_array.each_index { |x| puts "Student Group #{x+1} should have #{new_array2[x]} students: #{new_array[x].count == new_array2[x]}" }
puts "=============================================================================================="

short_list_10 = ["Jonny", "Beatty", "Third Wheel", "Afghanistan", "Albania", "Algeria", "Angola", "Antigua & Deps", "Bangladesh", "Barbados"]
new_array = (make_groups(short_list_10))
new_array2 = [5, 5]
puts " "
puts "There should be #{new_array2.count} Student Groups: #{new_array.count == new_array2.count}"
new_array.each_index { |x| puts "Student Group #{x+1} should have #{new_array2[x]} students: #{new_array[x].count == new_array2[x]}" }
puts "=============================================================================================="

# short_list_11 = ["Jonny", "Beatty", "Third Wheel", "Afghanistan", "Albania", "Algeria", "Angola", "Antigua & Deps", "Bangladesh", "Barbados", "Burundi"]
# new_array = (make_groups(short_list_11))
# new_array2 = [6, 5]
# puts " "
# puts "There should be #{new_array2.count} Student Groups: #{new_array.count == new_array2.count}"
# new_array.each_index { |x| puts "Student Group #{x+1} should have #{new_array2[x]} students: #{new_array[x].count == new_array2[x]}" }
# puts "=========== This test crashes program ========================================================="

short_list_12 = ["Jonny", "Beatty", "Third Wheel", "Afghanistan", "Albania", "Algeria", "Angola", "Antigua & Deps", "Bangladesh", "Barbados", "Burundi", "Cambodia"]
new_array = (make_groups(short_list_12))
new_array2 = [4, 4, 4]
puts " "
puts "There should be #{new_array2.count} Student Groups: #{new_array.count == new_array2.count}"
new_array.each_index { |x| puts "Student Group #{x+1} should have #{new_array2[x]} students: #{new_array[x].count == new_array2[x]}" }
puts "=============================================================================================="

# 5. Reflection

# The challenge took some time, and for it still isn't fully done- for input arrays wit 6, 7, or 11 elements the program fails.
# I need to create some more code to handle these edge cases. But for now I'm moving on to other excercises. 
#
# I used the .slice! method to create my initial student_groups array. This worked very well, and if not for the requirement to 
# put the remaining students not in a group of 4 back into one of the other groups we would be done.  The .slice! method removes
# x number of elements form an array. By having .slice! remove 4 elements at a time I could push them onto the student_groups array.
#
# I then added some code to push any remaining students onto the first few elements of the student_groups array, giving my an array of 
# arrays, each element either 4 or 5 students. This arrangement made it easy to output the groups and using the element index number them
# in a nice fashion. 
#
# For the driver code, I created some simple algorithms to check the data points I felt necissary. This made it easy to create a bunch of checks, 
# as the code was cut and paste. I just had to change the new_array2 elements to account for a new data set.
# I did have to change that algorithm for the very small data sets (< 4). So, I can easily add more driver code if needed.
#
# The big thing I learned from this exercise is that the last 5% of the work takes 80% of the time!. Getting the code to work on small data sets
# was a big pain, and still not done for 3 cases. 
#
# Oh one other thing- getting data sets to test with was a minor exercise in it's self. I went online and copied a list of US states, and a list
# of countries, then used google docs to format them so I could use them as test arrays. I kept those lists, so anytime I want big or small arrays, 
# I've got them.
