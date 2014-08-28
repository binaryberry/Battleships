require './lib/grid'
require './lib/cell'
require './lib/player'

class Game

	attr_reader :player1, :player2, :grid1, :grid2

	def initialize(player1, player2)
	@player1 = player1
	@player2 = player2
	@player1_with_grid = create_ships
	@player2_with_grid = create_ships
	@grid1 = Grid.new(player1.name)
	@grid2 = Grid.new(player2.name)
	@turn = player1
	end

	def opponent
		self.turn == player1 ?  player2 : player1 
	end


	def place ship, on_behalf_of: "player", on_cell: cell, facing: "vertically"
		on_behalf_of.grid.place(ship, on_cell, facing)
	end 


	def turn
		@turn
	end

	def shoot(coordinates)
		opponent.grid.hit(coordinates)
		winner?(turn)
		switch_turn
	end

	def winner?(player)
	player.all_ships_sunk?
	end

	def switch_turn
		self.turn == player1 ? @turn = player2 : @turn = player1 	
	end

	def create_ships
	aircraft_carrier=Ship.aircraft_carrier
	battleship=Ship.battleship
	submarine=Ship.submarine
	destroyer=Ship.destroyer
	patrol_boat=Ship.patrol_boat	
	[aircraft_carrier, battleship, submarine, destroyer, patrol_boat]
	end

end 