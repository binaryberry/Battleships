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
	

end