require './lib/grid'
require './lib/cell'
require './lib/player'

class Game

	attr_reader :player_1, :player_2, :grid1, :grid2, :player1_with_grid, :player2_with_grid

	def initialize(player1, player2)
	@player_1 = Player.new(player1)
	@player_2 = Player.new(player2)
	@player1_with_grid = create_ships(player_1)
	@player2_with_grid = create_ships(player_2)
	@grid1 = Grid.new(player_1.name)
	@grid2 = Grid.new(player_2.name)
	@turn = player_1
	end

	def opponent
		self.turn == player_1 ?  player_2 : player_1 
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
		self.turn == player_1 ? @turn = player_2 : @turn = player_1 	
	end

	def create_ships(player)
		{
			aircraft_carrier: Ship.aircraft_carrier(player),
		  battleship:       Ship.battleship(player),
		  submarine:        Ship.submarine(player),
		  destroyer:        Ship.destroyer(player),
		  patrol_boat:      Ship.patrol_boat(player)
		}
	end

end 