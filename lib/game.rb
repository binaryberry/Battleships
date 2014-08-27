require './lib/board'
require './lib/cell'

class Game

	attr_reader :player1, :player2, :board1, :board2

	def initialize(player1, player2)
	@player1 = player1
	@player2 = player2
	@turn = player1
	end

	def opponent
		@player2
	end


	def place ship, on_behalf_of: "player", on_cell: cell, facing: "vertically"
		on_behalf_of.board.place(ship, on_cell, facing)
	end 


	def turn
		@turn
	end

	def shoot(coordinates)
		player2.board.hit(coordinates)
		winner?(player1)
		switch_turn
	end

	def winner?(player)
	player.all_ships_sunk?
	end

	def switch_turn
		self.turn == player1 ? @turn = player2 : @turn = player1 
		self.opponent == player2 ? @opponent = player1 : @opponent = player2 
		
	end
end 