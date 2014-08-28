class Player
	attr_reader :name, :board
	
	def initialize(name)
	@name = name
	end

	def add_board(board)
	@board = board
	end

	

end