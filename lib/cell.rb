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

	def print_cell
		print "~" if content 			== "water" and status == nil
		print "#" if content.class 	== Ship and status == nil
		print "x" if content.class 	== Ship and status == "hit"
		print "*" if content 			== "water" and status == "miss"
	end


end