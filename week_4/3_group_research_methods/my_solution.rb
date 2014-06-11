# U2.W4: Research Methods

i_want_pets = ["I", "want", 3, "pets", "but", "only", "have", 2]
my_family_pets_ages = {"Evi" => 6, "Hoobie" => 3, "George" => 12, "Bogart" => 4, "Poly" => 4, 
            "Annabelle" => 0, "Ditto" => 3}
         

# Person 1's solution
def my_array_finding_method(source, thing_to_find)
  # Your code here!
end

def my_hash_finding_method(source, thing_to_find)
  # Your code here!
end

# Identify and describe the ruby method you implemented. 
# 
#
#


# Person 2 (Joey Sabani)
def my_array_modification_method(source, thing_to_modify)
  source.map! do |x|
    if x.is_a? Fixnum
      x + thing_to_modify
    else
      x
    end
  end
end

def my_hash_modification_method(source, thing_to_modify)
  source.update(source){|x,v| v + thing_to_modify}
end

# Identify and describe the ruby method you implemented. 
# the map! method performs the block once for each element in the array and returns the modified value.
  # apply the map method to your source array and perform a block to add the thing_to_modify 
# the update method updates the hash with the new hash created within the block
  # this method updates your existing hash with a new hash created with the same elements as the prior


# Person 3 (Mike Daugherty)
def my_array_sorting_method(source)

  # make copy so original isn't modified.
  source_copy = Array.new(source)

  # checks for numeric values and converts any to string
  source_copy.each_index { |x| source_copy[x] = source_copy[x].to_s }
  return source_copy.sort_by { |x| x }

end

def my_hash_sorting_method(source)

  # the double sort will ensure that duplicate values are 
  # sorted by thier key, to match the driver code expected output
  key_sorted = source.sort_by { |key, val| key }
  return key_sorted.sort_by { |key, val| val }

end

# Identify and describe the ruby method you implemented. 
#   I used the sort_by method to sort both the Array and Hash.
#
#   For the Array, I first had to convert the Numeric values
#   to Strings. Then I just fed them into the sort_by method
#
#   For the Hash, I first had to sort by keys, then again by value.
#   This was so any duplicate values would be sorted alphabetically
#   by the key.


# Person 4 (Stephanie Chou)

# deletes any word containing the thing_to_delete
def my_array_deletion_method(source, thing_to_delete)
  source.each do |element|
      if element.include? thing_to_delete
        source.delete(element)
    end
  end  
end

# i used element.include? something. this checks if something is included in an element. This something could be a 
# number, a string or a character
# I also used delete. This can be used to delete an element from an array. Delete(element) will delete anything in the 
# array that matches the element. 

# removes the thing to delete
def my_hash_deletion_method(source, thing_to_delete)
  #Your code here!
  source.delete(thing_to_delete)
  return source
end
# 
#

#


################## DRIVER CODE ###################################
# HINT: Use `puts` statements to see if you are altering the original structure with these methods. 
# Each of these should return `true` if they are implemented properly.

p my_array_finding_method(i_want_pets, "t") == ["want","pets","but"]
p my_hash_finding_method(my_family_pets_ages, 3) == ["Hoobie", "Ditto"]
p my_array_modification_method(i_want_pets, 1) == ["I", "want", 4, "pets", "but", "only", "have", 3 ]
p my_hash_modification_method(my_family_pets_ages, 2) == {"Evi" => 8, "Hoobie" => 5, "George" => 14, "Bogart" => 6, "Poly" => 6, "Annabelle" => 2, "Ditto" => 5}
p my_array_sorting_method(i_want_pets) == ["3", "4", "I", "but", "have", "only", "pets", "want"]
p my_hash_sorting_method(my_family_pets_ages) == [["Annabelle", 2], ["Ditto", 5], ["Hoobie", 5], ["Bogart", 6], ["Poly", 6], ["Evi", 8], ["George", 14]] 
# This may be false depending on how your method deals with ordering the animals with the same ages.
p my_array_deletion_method(i_want_pets, "a") == ["I", 4, "pets", "but", "only", 3 ]
p my_hash_deletion_method(my_family_pets_ages, "George") == {"Evi" => 8, "Hoobie" => 5, "Bogart" => 6, "Poly" => 6, "Annabelle" => 2, "Ditto" => 5}


# Reflect!

# Reflect!
# # Person 3 (Mike Daugherty)
#   Using the same method for both arrays and hashes was a pain, but I got it done.
#   I first had to sort the array, which required me to convert the Numberic 
#   values to strings. Once that was done I used the .sort_by method to sort
#   everything by thier ascii values.
# 
# For the hash, I just needed to sort it twice- once by it's key, then again
#   by it's value so the duplicate values would be sorted by their key. I just used
#   the .sort_by method twice, one for the key, and once for the value. I suspect there
#   is a way to do this double sort at the same time, but I didn't get that figured out
#   in time, so I'm staying with what I have
# 
# 
# 
# 
# 
