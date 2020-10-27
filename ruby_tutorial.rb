#  https://github.com/InnoExcell/Ruby_Practice.git

# FLOW OF CONTROL EXAMPLES

# if/elsif/else example
a = 6 # declare a variable

if a == 3
	puts "a is 3"
elsif a == 5
	puts "a is 5"
else
	puts "a is not 3 or 5"	
end

puts "-----------------"
#unless example

a = 6

unless a == 6
	puts "a is not 6"
else
	puts "a is 6"
end

puts "-----------------"
# while example

a = 15
while a > 9
	puts a
	a -= 1
	# same as a = a -1
end

puts "-----------------"
# until example

a = 6
until a >= 10
	puts a
	a += 1 #same as a = a + 1
end


# FLOW OF CONTROL: MODIFIER FORM

# if, unless, while, until - on the same line as one statement

puts "-----------------"
# if modifier form

a = 5
b = 0

puts "One liner" if a == 5 and b == 0


puts "-----------------"
# while modifier form

times_2 = 2
times_2 *= 2 while times_2 < 100
puts times_2


puts "-----------------"
# case expressions

# there are two flavors of case expressions in ruby

case # 1ST FLAVOUR

	age = 16

	when age >= 21
		puts "You can buy a drink"
	when 1 == 0
		puts "Written by a drunk programmer"
	else
		puts "Default condition"
end


puts "-----------------"

name = 'Smith'
case name # 2nd FLAVOR

	when /fish/i then puts "Something is fishy here"
	when 'Smith' then puts "Your name is Smith"
end

puts "-----------------"
# for loop

for i in 0..2
	puts i
end
		
puts "-----------------"
# METHODS AND FUNCTIONS

# Methods having default arguments

def factorial (n)
	n == 0? 1 : n * factorial(n-1)	
end

puts factorial 5

puts "-----------------"
# METHODS AND FUNCTIONS

# Methods having default arguments cont'd

def factorial_with_default (n = 5)
	n == 0? 1 : n * factorial_with_default(n-1)	
end

puts factorial_with_default

puts "-----------------"
# METHODS AND FUNCTIONS

puts factorial_with_default(6)

puts "-----------------"
# METHODS AND FUNCTIONS

# Splat: prefixes parameter inside method definition

def max(one_param, *numbers, another)
	# Variable length parameters passed in
	# become an array
	numbers.max	
end

puts max("something", 7, 32, -4, "more")

puts "-----------------"
# BLOCKS

# Blocks can accept arguements

1.times { puts "Hello World"}

puts "-----------------"

4.times do |index|
	if index > 0
		puts index	 	
	 end 
end

puts "-----------------"
# OR using a single line curly braces

2.times { |index| puts index if index > 0}

puts "-----------------"
# how to use blocks

# 1. Implicit usage: here, use block_given? to check
# if block was passed; and then use yield to call the
# block.

# implicit example

def two_times_implicit
	return "No block" unless block_given?
	yield	
	yield
end

puts two_times_implicit { print "Hello "}

puts "-----------------"

puts two_times_implicit

puts "-----------------"

def two_times_explicit (&i_am_a_block)
	return "No block" if i_am_a_block.nil?
	i_am_a_block.call
	i_am_a_block.call
end

puts two_times_explicit
two_times_explicit { puts "Hello"}

puts "-----------------"
# Reading from a file

File.foreach("test.txt") { |line| puts line; p line; p line.chomp; p line.split }

puts "-----------------"

File.foreach("test.txt") do |line|
	puts line
	p line
	p line.chomp # chops off newline character '\n'
	p line.split # array of words in line
end

puts "-----------------"
# Reading from a non-existing file

begin

	File.foreach("do_not_exist.txt") { |line| puts line.chomp }

rescue Exception => e
	puts e.message
	puts "Let's pretend this didn't happen..."
end

puts "-----------------"
# Alternative to exceptions

# however, this only applies to simple cases of not being able
# to find a file.

if File.exist? 'temp.txt'

	File.foreach( 'temp.txt') do |line|
		puts line.chomp
	end

end

puts "-----------------"
# Writing to a new file: note, file test1.txt was non-existent before.
# File.open automatically creates it.

File.open("test1.txt", "w") do |file|
	file.puts "One line"
	file.puts "Another"
end


# Environment Variables

puts ENV["EDITOR"]

#Strings / Interpolation

single_quoted = 'ice cream \n followed by it\'s a party!'
double_quoted = "ice cream \n followed by it\'s a party!"

puts single_quoted
puts double_quoted

# Interpolation (only available in double-quoted strings)
def multiply (one, two)
	"#{one} multiplied by #{two} equals #{one * two}"	
end
puts multiply(5, 3)

# More Strings

my_name = " tim"
puts my_name.lstrip.capitalize # changes the first letter in name to capital
p my_name # shows the original string ignoring the capitalize command in 265
my_name.lstrip! # (desctructive) removes the leading space
my_name[0] = 'K' # replace the first character
puts my_name

# %Q{} is used for multiple lines string + functions like double-quoted string
cur_weather = %Q{It's a hot day outside
				Grab your umbrellas...}

puts cur_weather

cur_weather.lines do |line|
	line.sub! 'hot', 'rainy' # substitutes 'hot' with 'rainy'
	puts "#{line.strip}"
end  

# Strings API (https://ruby-doc.org/core-2.7.2/String.html)

# include? other_str => true or false

"hello".include? "lo" #=> true
"hello".include? "ol" #=> false
"hello".include? ?h #=> true
