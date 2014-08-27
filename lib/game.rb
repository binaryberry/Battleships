require './lib/board'
require './lib/cell'

class Game

	attr_reader :player1, :player2, :board1, :board2

	def initialize(player1, player2)
	@player1 = player1
	@player2 = player2
	@turn = player1
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
	end



	def ask_placement(board)
		# board.ships.each do |ship|
		# 	#board.placement = []	
		# 		# puts "Where would you like to place the first cell for your #{ship.name}? This ship is #{ship.length} cells long. ie: A1"
		# 		# coordinates = gets.chomp.capitalize
		# 		# lambda{board.cells[coordinates]}.accept(ship)
		# 		# board.placement << coordinates
		# 		# # puts "In which direction would you like the rest of the boat to go? Please enter up, down, left or right"
		# 		# direction = gets.chomp			
		# end
		# board.placement
	end
end 