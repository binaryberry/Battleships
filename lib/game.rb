require './lib/board'

class Game

	attr_reader :player1, :player2, :board1, :board2

	def initialize
	@player1 = Player.new
	@player2 = Player.new
	@board1 = Board.new(player1)
	@board2 = Board.new(player2)
	end

	
end 