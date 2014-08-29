require './lib/score'

class Ship

	attr_accessor :hit_count, :player
	attr_reader :length, :name

	def initialize(length,name, player)
	@length		= length
	@name     	= name
	@player 	= player
	@hit_count	= 0
	@placed		= false
	end

	def self.aircraft_carrier(player)
		new(5, "aircraft carrier", player)
	end

	def self.battleship(player)
		new(4, "battleship", player)
	end

	def self.submarine(player)
		new(3, "submarine", player)
	end

	def self.destroyer(player)
		new(3, "destroyer", player)
	end

	def self.patrol_boat(player)
		new(2, "patrol boat", player)
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

	def sunk?(score)
		score.red_alert(self) if hit_count == length
		return true if hit_count == length
		return false
	end
end
