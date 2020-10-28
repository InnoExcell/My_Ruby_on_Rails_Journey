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

puts "---------------------------"
# ARRAYS

# Arrays allow Heterogeneous Types

het_arr = [1, "two", :three] # heterogeneous types
puts het_arr[1] 

puts "---------------------------"

arr_words = %w{ what a great day today! }
puts arr_words[-2] # => day
puts "#{arr_words.first} - #{arr_words.last}"
p arr_words[-3, 2] #go back three elements from right and take two element

puts "---------------------------"

# (Range type covered later...)
p arr_words[2..4]

puts "---------------------------"

# Make a String out of array elements separated by 'space'
puts arr_words.join(' ')

puts "---------------------------"

# Modifying Arrays

# You want a stack (LIFO: Last In First Out)? Sure
stack = []; stack << "one"
stack.push ("two")

puts stack
puts stack.pop
puts stack

puts "---------------------------"

# You need a queue (FIFO: First In First Out)? We have those too...

a = [5,3,4,2].sort!.reverse!
p a #(this actually modified the array)
p a.sample(2) # => prints 2 random elements

a[6] = 33
p a 

puts "---------------------------"

# Array Processing

a = [1, 3, 4, 7, 8, 10]
a.each { |num| print num } #(no new line)
puts a # (inserts new line after each element)


puts "---------------------------"

new_arr = a.select { |num| num > 4 }
p new_arr # => [7, 8, 10]
new_arr = a.select { |num| num < 10 }.reject{ |num| num.even? }
p new_arr

puts "---------------------------"

# Multiply each element by 6 producing new array
new_arr = a.map { |x| x * 6 }
p new_arr

puts "---------------------------"

# RANGES

some_range = 1..3
puts some_range.max
puts some_range.include? 2

puts "---------------------------"

puts (1...10) === 10 # => false (end-exclusive)
puts ('a'...'r') === "b" # => true

puts "---------------------------"

p ('k'..'z').to_a.sample(3) # => ["l", "p", "u"]  or any other random array with 3 letters in range

puts "---------------------------"

age = 7
case
	when 0..12 then puts "Still a baby"
	when 13..99 then puts "Teenager at heart!"
	else puts "You are getting older..."
end

puts "---------------------------"

# HASHES

editor_props = { "font" => "Arial", "size" => 12, "color" => "red"}

# THE ABOVE IS NOT A BLOCK - IT'S A HASH
puts editor_props.length 
puts editor_props["font"]

editor_props["background"] = "Blue"
editor_props.each_pair do |key, value|
	puts "Key: #{key}, Value: #{value}."
end

puts "---------------------------"

# Hashes cont'd Accessing Values in Hash for non existent entry

word_frequency = Hash.new(0)

sentence = "Chicka chicka boom boom"
sentence.split.each do |word|
	word_frequency[word.downcase] += 1
end

p word_frequency # => {"chicka" => 2, "boom" => 2}

puts "---------------------------"

# Hash examples showing that order of entry is preserved and when hash is used as last arguement to a method, {} are optional.

family_tree_19 = {oldest: "Jim", older: "Joe", younger: "Jack"}
family_tree_19[:youngest] = "Jeremy"
p family_tree_19
puts "---------------------------"

# Named parameter "like" behavior...

def adjust_colors (props = {foreground: "red", background: "white"})
	puts "Foreground: #{props[:foreground]}" if props[:foreground]
	puts "Background: #{props[:background]}" if props[:background]
end
adjust_colors
puts "---------------------------"

adjust_colors ({ :foreground => "green"})
adjust_colors background: "yella"
adjust_colors :background => "magenta"

puts "---------------------------"

#BLOCK AND HASH CONFUSION

# Let's say you have a Hash
a_hash = { :one => "one"}

# Then, you output it
puts a_hash # => {:one=>"one"}

# Doing it one step throws a SyntaxError
# puts { :one => "one"}

# Reason: Ruby confuses the {} for a block

# Fix: Use Parens ()
puts ({ :one => "one" }) # => {:one=>"one"}

# Or drop the {} altogether...
puts one: "one" # => {:one=>"one"} 


puts "---------------------------"

# OBJECT CREATION

class Persons
	def initialize (name, age) # "Constructor"
		@name = name
		@age = age		
	end
	def get_info
		@additional_info = "Interesting"
		"Name: #{@name}, age: #{@age}"		
	end
end

person1 = Persons.new("Joe", 14)
p person1.instance_variables # [:@name, :@age]
puts person1.get_info 
p person1.instance_variables

puts "---------------------------"

# ACCESSING DATA

class Somebody
	def initialize (name, age) # "Constructor"
		@name = name
		@age = age		
	end
	def name
		@name
	end
	def name= (new_name)
		@name = new_name
	end
end

person1 = Somebody.new("Joe", 14)
puts person1.name # Joe
person1.name = "Mike"
puts person1.name # Mike
# puts person1.age # undefined method 'age' for #<Person:

puts "---------------------------"

class Person
	attr_accessor :name, :age # getters and setters for name and age
end

person1 = Person.new
p person1.name # => nil
person1.name = "Mike"
person1.age = 15
puts person1.name # => Mike
puts person1.age # => 15
person1.age = "fifteen"
puts person1.age # => fifteen	

puts "---------------------------"

# SELF

class Person
	attr_reader :age
	attr_accessor :name

	def initialize (name, ageVar) # CONSTRUCTOR
		@name = name
		self.age = ageVar # call the age= method
		puts age		
	end
	def age= (new_age)
		@age = new_age unless new_age > 120			
	end
end

person1 = Person.new("Kim", 13) # => 13
puts "My age is #{person1.age}" # => My age is 13
person1.age = 130 # Try to change the age
puts person1.age # => 13 (The setter didn't allow the change)

puts "---------------------------"

# Class Inheritance

# Double Pipe || Operator

class Person
	attr_reader :age
	attr_accessor :name


	def initialize (name, age) # CONSTRUCTOR
		@name = name
		self.age = age # call the age= method
	end
	def age= (new_age)
		@age ||= 5 # default
		@age = new_age unless new_age > 120
	end
end
person1 = Person.new("Kim", 130)
puts person1.age # => 5 (Defualt)
person1.age = 10 # => change to 10
puts person1.age # => 10
person1.age = 200 # => Tries to change to 200
puts person1.age # => 10 (refuses the change cos of the new_age condition)


puts "---------------------------"

# Class Methods and Variables

class MathFunctions
	def self.double(var) #1. Using self 		
		times_called
		var * 2
	end
	class << self #2. Using << self
		def times_called
			@@times_called ||= 0
			@@times_called += 1
		end
	end
end
def MathFunctions.triple(var) #3. Outside of class
	times_called
	var * 3
end

# No instance created
puts MathFunctions.double 5 # => 10
puts MathFunctions.triple(3) # => 9
puts MathFunctions.times_called # => 3


puts "---------------------------"
# Inheritance

class Dog
	def to_s
		"Dog"
	end
	def bark
		"barks loudly"
	end
end
class SmallDog < Dog
	def bark # Override
		"barks quietly"
	end
end

dog = Dog.new # (btw, new is a class method)
small_dog = SmallDog.new
puts "#{dog}1 #{dog.bark}" # => Dog1 barks loudly
puts "#{small_dog}2 #{small_dog.bark}" # => Dog2 barks quietly

puts "---------------------------"

# Module as Namespace

module Sports
	class Match
		attr_accessor :score
	end
end

module Patterns
	class Match
		attr_accessor :complete
	end
end

match1 = Sports::Match.new  # (Note the use of :: operator)
match1.score = 45 
puts match1.score # => 45

match2 = Patterns::Match.new
match2.complete = true
puts match2.complete # => true

puts "---------------------------"

# Module as Mixin

module SayMyName
	attr_accessor :name
	def print_name
		puts "Name: #{@name}"
	end
end

class Individual
	include SayMyName
end
class Company
	include SayMyName
end

individual = Individual.new
individual.name = "Joe"
individual.print_name # => Name: Joe
company = Company.new
company.name = "The Circumspect Ltd"
company.print_name # => Name: The Circumspect Ltd"


puts "---------------------------"
# Enumerable in Action

require_relative 'player'
require_relative 'team'

player1 = Player.new("Bob", 13, 5)
player2 = Player.new("Jim", 15, 4.5)
player3 = Player.new("Mike", 21, 5)
player4 = Player.new("Joe", 14, 5)
player5 = Player.new("Scott", 16, 3)

red_team = Team.new("Red")
red_team.add_players(player1, player2, player3, player4, player5) # (splat)

# select only players betweeen 14 and 20 and reject any player below 4.5 skill-level
elig_players = red_team.select {|player| (14..20) === player.age }.reject {|player| player.skill_level < 4.5}

puts elig_players
puts "---------------------------"

# Scope of Variables

v1 = "outside"

class MyClass
	def my_method
		#p v1 # Exception Thrown - no such variable exists
		v1 = "inside"
		p v1
		p local_variables
	end
end

p v1 # => outside
obj = MyClass.new
obj.my_method # => inside
			  # => [:v1]
p local_variables # => [:v1, :obj]
p self # => main

puts "---------------------------"

# Scope of Constants

module Test 
	PI = 3.14
	class Test2
		def what_is_pi
			puts PI
		end
	end
end
Test::Test2.new.what_is_pi


module MyModule
	MyConstant = 'Outer Constant'
	class MyClass
		puts MyConstant # => Outer Constant
		MyConstant = 'Inner Constant'
		puts MyConstant # => Inner Constant
	end
	puts MyConstant # => Outer Constant
end

puts "---------------------------"

# Scope of Blocks

class BankAccount
	attr_accessor :id, :amount
	def initialize(id, amount)
		@id = id
		@amount = amount
	end
end

acct1 = BankAccount.new(123, 200)
acct2 = BankAccount.new(321, 100)
acct3 = BankAccount.new(421, -100)
accts = [acct1, acct2, acct3]

total_sum = 0
accts.each do |eachAcct|
	total_sum += eachAcct.amount
end

puts total_sum # => 200
		

puts "---------------------------"

# Block: Local Scope

arr = [5, 4, 1]
cur_number = 10
arr.each do |each_number|
	some_var = 10 # NOT available outside the block
	print each_number.to_s + " " # => 5 4 1
end
puts # print a blank line

puts cur_number # => 10

adjustment = 5
arr.each do |cur_number;adjustment|
	adjustment = 10
	print "#{cur_number + adjustment} " # => 15 14 11
end
puts 
puts adjustment # => 5 (Not affected by the block)

puts "---------------------------"

# Encapsulation

class Car 
	def initialize(speed, comfort)
		@rating = speed * comfort
	end

	# Can't SET rating from outside
	def rating
		@rating
	end
end

puts Car.new(4, 5).rating # => 20

puts "---------------------------"

# Specifying Access Control

class MyAlgorithm
	private 
		def test1
			"Private"		
		end
	protected
		def test2
			"Protected"
		end
	public
		def public_again
			"Public"
		end
end

class Another
	def test1
		"Private, as declared later on"
	end
	private :test1
end


puts "---------------------------"
# Sum of Two Numbers

def two_sums(first_num, second_num)
	"the sum of #{first_num} and #{second_num} equals #{first_num + second_num}"
end
puts two_sums(15, 20)

puts "---------------------------"

# Private Access

class Person 
	def initialize(age)
		self.age = age # Legal -Exception
		puts my_age
		#puts self.my_age 	# ILLEGAL
							# CANNOT USE self or any other receiver
	end

	private 
		def my_age
			@age
		end
		def age=(age)
			@age = age
		end
end

puts "---------------------------"
puts "---------------------------"
puts "---------------------------"

