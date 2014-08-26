require './lib/ship'


class Board

	def initialize
	aircraft_carrier=Ship.new(5)
	battleship=Ship.new(4)
	submarine=Ship.new(3)
	destroyer=Ship.new(3)
	patrol_boat=Ship.new(2)

	end


	def cells
	@cells = []
	v=0
		("A".."J").each do |letter|
			(1..10).each do |number|
			k="#{letter}#{number}"
			
			@cells[v]=k
			v+=1
			end
		end
	@cells
	end

	def ships
	@ships 
	end

	def add_ship(ship)
	@ships << ship
	end




end

# class Ship
# def initialize
# @hits_left = 5
# end
# def hit!
# @hits_left -= 1
# "boom"
# end
# end