class Cell

	attr_accessor :status, :content
	attr_reader :coordinates

	def initialize(coordinates)
		@status = nil
		@content ||= 'water'
		@coordinates = coordinates
	end

	def accept ship
		#count    = ship.length
		#raise 'No more cells for this ship' if count
		@content = ship
		ship.place!
		#ship.place! if count
		
	end


	def hit_it!
		if @content == 'water'
			@status = 'miss' 
		else
			@status = 'hit'
			content.hit!
			return content.sunk?
		end
		return false
	end


end