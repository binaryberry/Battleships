
# require './lib/ship'
require 'cell'

class Board

	def initialize
	create_cells
	create_ships
	end

	def create_cells
	@cells = {}
		("A".."J").each do |letter|
			(1..10).each do |number|
			k="#{letter}#{number}"
			@cells[k]=Cell.new(k)
			end
		end
	@cells
	end
	
	def create_ships
	aircraft_carrier=Ship.new(5)
	battleship=Ship.new(4)
	submarine=Ship.new(3)
	destroyer=Ship.new(3)
	patrol_boat=Ship.new(2)
	@ships = [aircraft_carrier, battleship, submarine, destroyer, patrol_boat]
	end

	def ask_placement(ship)
		length = ship.length
		@placement = []
		while length > 0 do
			puts "please input placement cell for #{ship}, ie:B11"
			coordinates = gets.chomp.capitalize
			@placement << coordinates
			length-=1
		end
		@placement
	end

end

