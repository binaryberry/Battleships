require './lib/ship.rb'
require './lib/cell.rb'

class Grid

	attr_accessor :cells
	attr_reader :name

	def initialize(playername)
	@cells = {}
	create_cells
	@name = "#{playername}"
	end

	def create_cells
		("A".."J").each do |letter|
			(1..10).each do |number|
			k="#{letter}#{number}"
			cells[k]=Cell.new(k)
			end
		end
		cells
	end

	def place(ship,coordinates,orientation)
		for attempt in 1..2
			copy = coordinates
			ship.length.times do
				copy = test_cell_then_place ship, copy, orientation, attempt
			end
		end
	end

	def test_cell_then_place(ship,coordinates,orientation, attempt)
		raise "Cannot place ship there"  if cells[ coordinates ].content.class == ship.class and attempt == 1 #test
		cells[ coordinates ].content = ship if attempt == 2 #placement
		return coordinates.next if orientation == "vertically"
		return coordinates.reverse.next.reverse if orientation == "horizontally"
	end

	def hit(coordinates)
	end

end