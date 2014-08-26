class Cell

	attr_accessor :status, :content

	def initialize
		@status = nil
		@content ||= 'water'
	end

	def receive ship
		@content = ship
	end


	def hit!
	# 	#content.hit!
	# 	@status = 'hit'
		@status = 'miss'
	end



end