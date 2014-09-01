class Player
	attr_reader  :grid

	attr_accessor :name,:ships, :id
	
	def initialize(name)
	@name = name
	@grid = Grid.new(self.name)
	@ships = create_ships
	end

	def all_ships_sunk?

	end

	def create_ships
		{
			aircraft_carrier: Ship.aircraft_carrier,
		  battleship:       Ship.battleship,
		  submarine:        Ship.submarine,
		  destroyer:        Ship.destroyer,
		  patrol_boat:      Ship.patrol_boat
		}
	end

	# def ship_status_list(player)
	# 	{
	# 	aircraft_carrier: player.ships[aircraft_carrier:].sunk?
	# 	battleship:       player.ships[battleship:].sunk?
	# 	submarine:        player.ships[submarine:].sunk?
	# 	destroyer:        player.ships[destroyer:].sunk? 
	# 	patrol_boat:      player.ships[patrol_boat:].sunk?
	# 	}
	# end
	

end