# require './lib/ship'
require './lib/cell'


class Board

	def initialize
	# create_ships
	cells
	end


	def cells
	@cells = {}
		("A".."J").each do |letter|
			(1..10).each do |number|
			k="#{letter}#{number}"
			@cells[k]=Cell.new(k)
			end
		end
	@cells
	end

# 	def ships
# 	@ships 
# 	end

# 	def add_ship(ship)
# 	@ships << ship
# 	end

# def create_ships
# 	aircraft_carrier=Ship.new(5)
# 	battleship=Ship.new(4)
# 	submarine=Ship.new(3)
# 	destroyer=Ship.new(3)
# 	patrol_boat=Ship.new(2)
# end
end