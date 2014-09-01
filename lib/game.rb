require './lib/grid'
require './lib/cell'
require './lib/player'

class Game

<<<<<<< HEAD

	attr_reader :player_1, :player_2, :grid1, :grid2, :player1_with_grid, :player2_with_grid

=======
	attr_reader 	:player_1, :player_2, :score
	attr_accessor	:turn
>>>>>>> 54f5d72086731aeddfc37cf6b140790e3226a6ce

	def initialize(player1, player2)
	@player_1 = Player.new(player1)
	@player_1.id = "player_1"
	@player_2 = Player.new(player2)
	@player_2.id = "player_2"
	@turn = player_1
	@score = Score.new
	end

	def opponent
		self.turn == player_1 ?  player_2 : player_1 
	end


	def place(ship, on_behalf_of, on_cell, facing)
		on_behalf_of.grid.place(ship, on_cell, facing)
	end 

	def shoot(coordinates)
		score.check(opponent) if opponent.grid.hit(coordinates)
		return "#{turn.name} has won the game!"	if score.winner?(turn)
		switch_turn
	end

	def switch_turn
		self.turn == player_1 ? @turn = player_2 : @turn = player_1 	
	end

end 