class Cell

	attr_accessor :status, :content
	attr_reader :coordinates

	def initialize(coordinates)
		@status = nil
		@content ||= 'water'
		@coordinates = coordinates
	end

	def receive ship
		count    = ship.length
		raise 'No more cells for this ship' if count
		@content = ship

	end


	def hit_it!
		if @content == 'water'
			@status = 'miss' 
		else
			@status = 'hit'
			content.hit!
		end
	end


end