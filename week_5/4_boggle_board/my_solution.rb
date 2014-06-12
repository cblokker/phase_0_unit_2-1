# U2.W5: A Nested Array to Model a Boggle Board

# I worked on this challenge [by myself].

boggle_board = [["b", "r", "a", "e"],
                ["i", "o", "d", "t"],
                ["e", "c", "l", "r"],
                ["t", "a", "k", "e"]]


# Part 1: Write a method that takes a row number and returns all the elements in the row.

# Pseudocode

######### part 1
## 	Write a method (get_row) that takes a row number and
## 	and returns all elements in the row.


# Initial Solution

def get_row(row_num, array_name)

	# validates input is an integer
	return "error, input number not an integer" until row_num.is_a? Integer

	return array_name[row_num]
end


# Refactored Solution


# DRIVER TESTS GO BELOW THIS LINE

(0..3).each { |e| puts "Row #{e} == #{boggle_board[e]} --> #{boggle_board[e] == get_row(e, boggle_board)}"}  
# puts "count for boggle_board array: #{boggle_board.count}"
# boggle_board.each_index {|e| puts "row #{e} is #{get_row(e)}"}


# Reflection 

#-------------------------------------------------------------------------------

# Part 2: Write a method that takes a column number and returns all the elements in the column.  

# Pseudocode

# Initial Solution


# Refactored Solution


# DRIVER TESTS GO BELOW THIS LINE


# Reflection 



