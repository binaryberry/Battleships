class Player
	attr_reader :name, :grid
	
	def initialize(name)
	@name = name
	@grid = Grid.new(self.name)
	end

	# def add_grid(grid)
	# @grid = grid
	# end

	

end