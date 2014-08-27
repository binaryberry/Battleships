class Ship

	attr_accessor :hit_count
	attr_reader :length, :name

	def initialize(length,name)
	@length		= length
	@name     = name
	@hit_count	= 0
	@placed		= false
	end

	def self.aircraft_carrier
		new(5, "aircraft_carrier")
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
