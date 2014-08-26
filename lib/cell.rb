class Cell

	attr_accessor :status, :content

	def initialize
		@status = nil
		@content ||= 'water'
	end

	def receive ship
		@content = ship
	end


	def hit_it
	# 	#content.hit!
	# 	@status = 'hit'
		if @content == 'water'
			@status = 'miss' 
		else
			@status = 'hit'
			content.hit!
		end
	end



end