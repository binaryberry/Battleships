require './lib/ship.rb'
require './lib/cell.rb'

class Grid

	attr_accessor :cells

	def initialize
	@cells = {}
	create_cells
	# create_ships
	end

	def create_cells
		("A".."J").each do |letter|
			(1..10).each do |number|
			k="#{letter}#{number}"
			@cells[k]=Cell.new(k)
			end
		end
		@cells
	end

	def place(ship,cell,orientation)
		number_of_cells = ship.length
		vertical_placement(ship,cell,number_of_cells) if orientation == "vertically"
		horizontal_placement(ship,cell,number_of_cells) if orientation == "horizontally"
	end

	def vertical_placement(ship,cell,number_of_cells)
		for j in 1..2
			for i in 1..number_of_cells
			 vertical_check_vs_set(j,ship,cell,i)
			end
		end
	end

	def vertical_check_vs_set(value,ship,cell,i)
		case 
		when value == 1
			raise "Cannot place ship there"  if @cells[ column_setter(cell,i) ].content.class == ship.class
		when value == 2 
			@cells[ column_setter(cell,i) ].content = ship
		end
	end 

	def column_setter(cell,i)
		column_value = cell.gsub(/[A-J]/, '').to_i
		new_column = column_value + i -1
		return new_value = cell.gsub(/\d/, '') + new_column.to_s	
	end

	def horizontal_placement(ship,cell,number_of_cells)
		row_value = cell.gsub(/\d/, '')
		for i in 1..number_of_cells
			raise "Cannot place ship there" if @cells[ new_row_value(row_value,cell) ].content.class == ship.class 
			row_value = row_value.next
		end
		row_value = cell.gsub(/\d/, '')
		for i in 1..number_of_cells
			@cells[ new_row_value(row_value,cell) ].content = ship
			row_value = row_value.next
		end
	end

	def new_row_value(row_value,cell)
		row_value + cell.gsub(/[A-J]/, '')
	end

	
	# def create_ships
	# 	aircraft_carrier=Ship.new(5)
	# 	battleship=Ship.new(4)
	# 	submarine=Ship.new(3)
	# 	destroyer=Ship.new(3)
	# 	patrol_boat=Ship.new(2)
	# 	@ships = [aircraft_carrier, battleship, submarine, destroyer, patrol_boat]
	# end

	# def print_line(line_number)
	# 	@cells.select {|key, cell| key.sub(/[A-J]/, '*') == '*' + line_number.to_s}.each {|key, cell| cell.print_cellh }
	# end

	# def print_grid
	# 	@cells

	# end

end