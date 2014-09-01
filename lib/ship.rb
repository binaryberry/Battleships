require './lib/score'

class Ship

	attr_accessor :hit_count
	attr_reader :length, :name

	def initialize(length,name)
	@length		= length
	@name     	= name
	@hit_count	= 0
	@placed		= false
	end

	def self.aircraft_carrier
		new(5, "aircraft carrier")
	end

	def self.battleship
		new(4, "battleship")
	end

	def self.submarine
		new(3, "submarine")
	end

	def self.destroyer
		new(3, "destroyer")
	end

	def self.patrol_boat
		new(2, "patrol boat")
	end

	def hit!
		@hit_count += 1
	end

	def placed?
		@placed
	end

	def place!
		@placed = true
	end

	def sunk?
		return true if hit_count == length
		return false
	end
end
