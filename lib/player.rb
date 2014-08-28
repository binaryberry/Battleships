class Player
	attr_reader  :grid

	attr_accessor :name
	
	def initialize(name)
	@name = name
	@grid = Grid.new(self.name)
	end

	# def add_grid(grid)
	# @grid = grid
	# end

	def all_ships_sunk?

	end
	

end