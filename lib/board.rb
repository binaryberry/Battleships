require 'cell'


class Board

	def initialize
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

# 	def ships
# 	@ships 
# 	end

# 	def add_ship(ship)
# 	@ships << ship
	end




# end

# class Ship
# def initialize
# @hits_left = 5
# end
# def hit!
# @hits_left -= 1
# "boom"
# end
# end