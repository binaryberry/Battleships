class Ship

	attr_accessor :hit_count
	attr_reader :length

	def initialize(length)
	@length		= length
	@hit_count	= 0
	@placed		= false
	end

	def hit_count
		@hit_count
	end

	def hit
		@hit_count += 1
	end

	def placed?
		@placed
	end

	def place
		@placed = true
	end

	def sunk?
		return true if hit_count == length
		return false
	end
end
