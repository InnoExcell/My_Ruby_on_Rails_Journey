# name of file - player.rb
# required file for ruby_tutorial program code: line 669

class Player
	include Enumerable # LOTS of functionality

	attr_reader :name, :age, :skill_level

	def initialize (name, age, skill_level)
		@name = name
		@age = age
		@skill_level = skill_level
	end

	def to_s
		"<#{name}: #{skill_level}(SL), #{age}(AGE)>"
	end

end
