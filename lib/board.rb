
# require './lib/ship'
require 'cell'r

class Board

	def initialize
	# create_ships
	cells
	@ships = create_ships
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


	
# 	def create_ships
# 	aircraft_carrier=Ship.new(5)
# 	battleship=Ship.new(4)
# 	submarine=Ship.new(3)
# 	destroyer=Ship.new(3)
# 	patrol_boat=Ship.new(2)
# 	end





end

