some_var = "false"
another_var = "nil"

if some_var == "pink elephant"
  puts "Don't think about the pink elephant!"

elsif another_var.nil?
  puts "Question mark in the method name?"

elsif some_var == false
  puts "Looks like this one should execute"

else
  puts "I guess nothing matched... But why?"
end


# it can be seen that the three conditions (if,
# first elsif, and second elsif all failed)
# for them to work, the following changes are
# required.

# condition one 
# if statement
# some_var = "pink elephant"

# condition two
# first elsif statement
# another_var = nil

# condition three
# second elsif statement
# some_var = false