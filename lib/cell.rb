class Cell

	attr_accessor :status, :content
	attr_reader :coordinates

	def initialize(coordinates)
		@status = nil
		@content ||= 'water'
		@coordinates = coordinates
	end

	def receive ship
		@content = ship
	end


	def hit_it
		if @content == 'water'
			@status = 'miss' 
		else
			@status = 'hit'
			content.hit!
		end
	end


end