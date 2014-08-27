
# require './lib/ship'
require './lib/cell'

class Board

	attr_reader :name, :ships, :cells

	attr_accessor :placement

	def initialize(playername)
	create_cells
	create_ships
	@name = "#{playername}"
	@placement = []
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
	aircraft_carrier=Ship.aircraft_carrier
	battleship=Ship.new(4, 'battleship')
	submarine=Ship.new(3, 'submarine')
	destroyer=Ship.new(3, 'destroyer')
	patrol_boat=Ship.new(2, 'patrol boat')
	@ships = [aircraft_carrier, battleship, submarine, destroyer, patrol_boat]
	end

	# def ask_placement(ship)
	# 	length = ship.length
	# 	@placement = []
	# 	while length > 0 do
	# 		puts "please input placement cell for #{ship}, ie:B11"
	# 		coordinates = gets.chomp.capitalize
	# 		@placement << coordinates
	# 		length-=1
	# 	end
	# 	@placement
	# end

	def ask_hit
		puts "which cell do you want to hit, officer? ie:A12"
		target = gets.chomp.capitalize
	end



end

