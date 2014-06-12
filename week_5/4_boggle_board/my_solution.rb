# U2.W5: A Nested Array to Model a Boggle Board


# I worked on this challenge [by myself].

boggle_board = [["b", "r", "a", "e"],
                ["i", "o", "d", "t"],
                ["e", "c", "l", "r"],
                ["t", "a", "k", "e"]]


puts "----------------------------- Part 1 --------------------------------------------------"
# Part 1: Write a method that takes a row number and returns all the elements in the row.

# Pseudocode

######### part 1
## 	Write a method (get_row) that takes a row number 
##  and an array, and returns all elements in the row.


# Initial Solution

def get_row(row_num, array_name) 

	# validates input is an integer, returns error if not
	return "error, input number not an integer" until row_num.is_a? Integer

	return array_name[row_num]
end


# Refactored Solution
	# no refactoring done.

# DRIVER TESTS GO BELOW THIS LINE

# tests output from each row of boggle_board array
(0..3).each { |e| puts "Row #{e} == #{boggle_board[e]} --> #{boggle_board[e] == get_row(e, boggle_board)}"}  

# Reflection 
## 	Had some confusion about the instructions due to the scope issue with the boogle_board array. When 
##  I saw that it was up to us to solve the issue, I looked into the various ways to extend scope for 
##  boggle_board into the methods we were writing. I decided on just passing in the array to the method
##  allowed the most flexibility. I can reuse these methods for any other case where I want to traverse
##  a 2D array. The other viable option would have been to set boggle_board as a class variable, but that
##  seemed like overkill. I could also have declared boggle_board as a global variable, but I didn't feel
##  it was worth going that route. The methods get row needs 2 inputs to do it's job, so give it what it
##  needs.

puts "----------------------------- Part 2 --------------------------------------------------"

# Part 2: Write a method that takes a column number and returns all the elements in the column.  

# Pseudocode
######### part 2
## 	Write a method (get_col) that takes a column number 
##  and an array, and returns all elements in that column.
##  	create double loop to iterate thru
## 		each row to access the element at the column number.

# Initial Solution
def get_col(col_num, array_name)

	out_array = Array.new
	
	array_name.each { |row| out_array.push(row [col_num]) }
	return out_array
end


# Refactored Solution



# DRIVER TESTS GO BELOW THIS LINE

# tests output of each column element 0 - 3 on 2d array
puts "#{get_col(0, boggle_board) == ["b", "i", "e", "t"]} --> boggle_board column 0 == [\"b\", \"i\", \"e\", \"t\"]"
puts "#{get_col(1, boggle_board) == ["r", "o", "c", "a"]} --> boggle_board column 0 == [\"r\", \"o\", \"c\", \"a\"]"
puts "#{get_col(2, boggle_board) == ["a", "d", "l", "k"]} --> boggle_board column 0 == [\"a\", \"d\", \"l\", \"k\"]"
puts "#{get_col(3, boggle_board) == ["e", "t", "r", "e"]} --> boggle_board column 0 == [\"e\", \"t\", \"r\", \"e\"]"


# Reflection 
## 	To get an array as output, I decided to push the designated col_num from
## 	each row of the input array onto a new array. Then I can just return the 
##  new array. For the drive tests, I just hand coded the comparisons as I didn't
## 	see any simple way to automate this. 
##  In this case my pseudo code wasn't followed. I am used to itterating through 2D arrays
##  using a double loop to interate the var for row and column at the appropriate time.
##  As I got into this, I saw that because the col_num variable never changes, I didn't
##  need to do that. And the #each method worked fine on it's own.


