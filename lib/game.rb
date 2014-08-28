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
		self.turn == player1 ?  player2 : player1 
	end


	def place ship, on_behalf_of: "player", on_cell: cell, facing: "vertically"
		on_behalf_of.board.place(ship, on_cell, facing)
	end 


	def turn
		@turn
	end

	def shoot(coordinates)
		opponent.board.hit(coordinates)
		winner?(turn)
		switch_turn
	end

	def winner?(player)
	player.all_ships_sunk?
	end

	def switch_turn
		self.turn == player1 ? @turn = player2 : @turn = player1 	
	end

	def create_ships(player)
	aircraft_carrier=Ship.aircraft_carrier
	battleship=Ship.battleship
	submarine=Ship.submarine
	destroyer=Ship.destroyer
	patrol_boat=Ship.patrol_boat	
	player.board.ships = [aircraft_carrier, battleship, submarine, destroyer, patrol_boat]
	end
	# 	def create_ships
	# aircraft_carrier=Ship.aircraft_carrier
	# battleship=Ship.new(4, 'battleship')
	# submarine=Ship.new(3, 'submarine')
	# destroyer=Ship.new(3, 'destroyer')
	# patrol_boat=Ship.new(2, 'patrol boat')
	# @ships = [aircraft_carrier, battleship, submarine, destroyer, patrol_boat]
	# end
end 